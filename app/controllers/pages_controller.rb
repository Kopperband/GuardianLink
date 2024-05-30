class PagesController < ApplicationController
  include UserActions

  def Index

  end

  def dashboard
    @users = User.all

    if current_user
      if current_user.role == 'Admin'
        @nonprofits = User.where(role: :nonprofit)
        @volunteers = User.where(role: :volunteer)
        @current_user_name = current_user.first_name
      elsif current_user.role == 'Volunteer'
        @nonprofits = User.where(role: :nonprofit)
        @current_user_name = current_user.first_name
      elsif current_user.role == 'Non_Profit'
        @volunteers = User.where(role: :volunteer)
        @current_user_name = current_user.organization_name
      end
    else
      # Handle the case when no user is signed in
      redirect_to root_path, alert: "You need to sign in to access this page."
    end
  end

  def connect_mailer
    @parameters = Model.get_parameters

  end

  def user_profile

  end

  def change_role
    if current_user.role == 'Admin' # Ensure only admins can change roles
      User.where(id: params[:user_ids]).update_all(role: 'Admin')
      redirect_to dashboard_path, notice: "Users' roles updated successfully."
    else
      redirect_to dashboard_path, alert: "You don't have permission to perform this action."
    end
  end

  def reset_password
      user = User.find(params[:user_id])
      user.send_reset_password_instructions
      redirect_to users_path, notice: "Password reset email sent to #{user.email}"
  end

  def authenticate_admin!
    unless current_user && current_user.role == 'Admin'
    end
  end



end
