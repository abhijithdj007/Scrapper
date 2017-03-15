class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.roles == 0
      flash[:alert] = "Unauthorized Access!"
      redirect_to new_user_session_path
    end
  end
end
