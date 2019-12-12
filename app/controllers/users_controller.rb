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

  # def edit
  #   require_login
  #   @user = User.find_by(id: params[:id])
  #   if @user != current_user || !@user
  #     flash[:message] = "You can only edit your own profile."
  #     redirect_to user_path(current_user)
  #   end
  # end

  # def update
  #   # binding.pry
  #   @user = User.find_by(id: params[:id])
  #   @user.bio = params[:user][:bio]
  #   if @user.save
  #     redirect_to user_path(@user)
  #   else
  #     render :edit
  #   end
  #   # if @user.update_attributes(bio_param)
  #   #   redirect_to user_path(@user)
  #   # else
  #   #   render :edit
  #   # end
  # end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  # def bio_param
  #   params.require(:user).permit(:bio)
  # end
end
