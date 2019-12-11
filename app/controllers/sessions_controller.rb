class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:incorrect_login] = "Incorrect login info, please try again."
      redirect_to login_path
    end
  end

  def destroy
    if current_user
      session.delete :user_id
      redirect_to root_path
    end
  end

  def omniauth
    @user = User.from_omniauth(auth)
    session[:user_id] = @user.id
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
