# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_user_type, only: [:new, :create]
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
    session[:user_type] = params[:user_type] if %w[Volunteer Non_Profit].include?(params[:user_type])
    @user_type = session[:user_type]
  end

  def set_user_type
    session[:user_type] = params[:user_type] if params[:user_type].present?
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
    @user = User.find_by(params[:id])
    if @user
      @user.destroy
      redirect_to dashboard_path, notice: 'User was successfully deleted.'
    else
      redirect_to dashboard_path, alert: 'User not found.'
    end
  end


  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :first_name, :last_name, :organization_name, :hours_per_week,
      :background_check, :point_of_contact_email, :areas_of_concern])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :first_name, :last_name, :organization_name, :hours_per_week,
      :background_check, :point_of_contact_email, :areas_of_concern])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
