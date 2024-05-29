class PagesController < ApplicationController

  def Index

  end

  def choose_user_type

  end

  def dashboard
    @users = User.all

    if current_user
      if current_user.role == 'Admin'
        @nonprofits = User.where(role: :nonprofit)
        @volunteers = User.where(role: :volunteer)
        @current_user_name = current_user.hours_per_week
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

  def user_profile

  end

end
