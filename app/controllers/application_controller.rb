class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !!current_user
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    if !logged_in?
      flash[:danger] = "Sorry. You need to log in to visit that page."
      redirect_to root_path
    end
  end

  helper_method :logged_in?, :current_user
end
