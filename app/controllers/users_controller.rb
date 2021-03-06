class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    require_login
    @user = User.find_by(id: params[:id])
    redirect_to root_path if !@user
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
