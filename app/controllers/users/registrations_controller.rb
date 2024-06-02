

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_user_type, only: [:new, :create]
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  skip_before_action :require_no_authentication, only: [:new, :create]


  # POST /resource
  def create
    if current_user && current_user.role == 'Admin'
      create_admin_user
    else
      super
    end
  end

  # DELETE /resource
  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      @user.destroy
      redirect_to dashboard_path, notice: 'User was successfully deleted.'
    else
      redirect_to dashboard_path, alert: 'User not found.'
    end
  end

  def admin_registration
    @admin_create = User.new
  end

  protected

  def sign_up(resource_name, resource)
    sign_in(resource_name, resource) unless current_user
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    permitted_params = [:email, :password, :password_confirmation, :first_name, :last_name, :organization_name, :hours_per_week,
                        :background_check, :point_of_contact_email, :areas_of_concern]
    permitted_params << :role if current_user && current_user.role == 'Admin'
    devise_parameter_sanitizer.permit(:sign_up, keys: permitted_params)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :first_name, :last_name, :organization_name, :hours_per_week,
                                                              :background_check, :point_of_contact_email, :areas_of_concern])
  end

  private

  def set_user_type
    session[:user_type] = params[:user_type] if params[:user_type].present?
    puts "#{session[:user_type]}"
  end

  def create_admin_user
    puts "CREATE USER METHOD"
    @admin_create = User.new(sign_up_params)
    puts "#{@admin_create.role}"
    self.resource = @admin_create
    if @admin_create.save
      redirect_to dashboard_path, notice: 'New admin user created successfully.'
    else
      puts "Error creating admin user"
      render :new, alert: @admin_create.errors.full_messages.join(', ')
    end
  end
end
