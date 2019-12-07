class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
    # change this so it's checking for current_user instead
  end

  def require_login
    flash[:message] = "You must be logged in to access that section"
    redirect_to root_path if !logged_in?
  end
end
