module UserActions
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_admin!
  end

  def reset_password
    @user = User.find(params[:id])
    @user.send_request_password_instructions
    puts "Sent"
    redirect_to dashboard_path, notice: "Password reset instructions sent to account email"
  end
end
