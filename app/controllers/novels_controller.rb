class NovelsController < ApplicationController
  before_action :require_login

  def new
    @novel = Novel.new
  end

  def create
    @novel = Novel.new(title: novel_params[:title], summary: novel_params[:summary])
    if @novel.save
      @novel.memberships.build(role: novel_params[:membership][:role], user_id: novel_params[:membership][:user_id])
      @novel.save
      redirect_to novel_path(@novel)
    else
      flash[:errors] = @novel.errors.full_messages
      render :new
    end
  end

  def index
    @user = User.find_by(id: params[:user_id])
    if @user != current_user
      flash[:message] = "You can only view your own novel list."
      redirect_to user_path(current_user)
    end
  end

  def show
    @novel = Novel.find_by(id: params[:id])
    if !member_of?(@novel)
      flash[:message] = "You can only view novels you are a member of."
      redirect_to user_path(current_user)
    end
  end

  def edit
    @novel = Novel.find_by(id: params[:id])
    if !@novel
      flash[:message] = "This novel does not exist."
      redirect_to root_path
    elsif !admin_of?(@novel)
      flash[:message] = "You can only edit novels you are an Admin of."
      redirect_to novel_path(@novel)
    end
    #add functionality here later so user can only edit their own novel
  end

  def update
    @novel = Novel.find_by(id: params[:id])
    @novel.update(novel_params)
    redirect_to novel_path(@novel)
  end

  def destroy
    Novel.find_by(id: params[:id]).destroy
    flash[:message] = "Novel was successfully deleted."
    redirect_to user_path(current_user)
  end

  private

  def novel_params
    params.require(:novel).permit(
      :title,
      :summary,
      # :membership,
      membership: [
        :id,
        :role,
        :user_id
      ] )
    #include membership attributes here membership_attributes: [array of attributes]
  end

end
