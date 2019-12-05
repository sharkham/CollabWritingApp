class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
    # change this so it's checking for current_user instead
  end

  def redirect_if_not_logged_in
    redirect_to root_path if !logged_in?
  end
end
