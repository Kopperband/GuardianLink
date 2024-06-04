#Pages Controller Class
class PagesController < ApplicationController
  include UserActions

  def new
    @admin_create = User.new
  end


  def dashboard
    @users = User.all
# Handles the input of user name at the top of the dashboard page
    if current_user
      if current_user.role == "Admin" || current_user.role == "Volunteer"
        @current_user_name = current_user.first_name
      elsif current_user.role == "Non_Profit"
        @current_user_name = current_user.organization_name
      end
    else
# Handle the case when no user is signed in
      redirect_to root_path, alert: "You need to sign in to access this page."
    end
  end

  def change_role
# Ensure only admins can change roles
    if current_user.role == "Admin"
      role = params[:role]
      if role.present? && ["Admin", "Volunteer", "Non_Profit"].include?(role)
        User.where(id: params[:user_ids]).update_all(role: role)
        redirect_to dashboard_path, alert: "Users' roles updated successfully."
      else
        redirect_to dashboard_path, alert: "Invalid role selected."
      end
    else
      redirect_to dashboard_path, alert: "You don't have permission to perform this action."
    end
  end


  def reset_password
    user = User.find(params[:user_id])
    user.send_reset_password_instructions
    redirect_to dashboard_path, notice: "Password reset email sent to #{user.email}"
  end

# Custom Admin registration page
  def admin_registration
    @admin_create = User.new
  end

# Authenticates that the current users role is Admin
  def authenticate_admin!
    unless current_user && current_user.role == "Admin"
    end
  end



end
