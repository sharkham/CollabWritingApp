class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :admin_of?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
    # change this so it's checking for current_user instead, not just any session id.
  end

  def require_login
    if !logged_in?
      flash[:message] = "You must be logged in to access that section"
      redirect_to root_path
    end
  end

  def member_of?(novel)
    current_user.novels && current_user.novels.include?(novel)
  end

  def admin_of?(novel)
    #if the user has memberships and if the user is a member of this novel, then:
    if !!current_user.memberships && !!current_user.memberships.find_by(novel_id: novel.id)
      membership = current_user.memberships.find_by(novel_id: novel.id)
      if membership.role == "Admin"
        return true
      else
        return false
      end
    else
      return false
    end
  end

  # def require_admin_of_novel
  #   relevant_novel = Novel.find_by(id: params[:novel_id])
  #   if !admin_of?(relevant_novel)
  #     flash[:message] = "You must be a novel Admin to access that section."
  #     redirect_to novel_path(relevant_novel)
  #   end
  # end

end
