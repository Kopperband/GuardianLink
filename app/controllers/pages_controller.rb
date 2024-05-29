class PagesController < ApplicationController
  def Index

  end

  def dashboard
    if current_user
      if session[:user_type] == "Admin"
        @nonprofits = User.where(role: :nonprofit)
        @volunteers = User.where(role: :volunteer)
        @current_user_name = current_user.email
      elsif session[:user_type] == "Volunteer"
        @nonprofits = User.where(role: :nonprofit)
        @current_user_name = current_user.first_name
      elsif session[:user_type] == "Non Profit"
        @volunteers = User.where(role: :volunteer)
        @current_user_name = current_user.organization_name
      end
    else
      # Handle the case when no user is signed in
      redirect_to root_path, alert: "You need to sign in to access this page."
    end
  end

  def user_profile

  end

end
