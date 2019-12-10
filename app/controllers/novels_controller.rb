class NovelsController < ApplicationController
  before_action :require_login

  def new
    @novel = Novel.new
    # @membership = @novel.memberships.build
    @membership = Membership.new
    #@novel = Novel.memberships.build
  end

  def create
    # binding.pry
    # @novel = Novel.new(novel_params)
    # @membership = Membership.new(role: "Admin")
    @novel = Novel.new(title: novel_params[:title], summary: novel_params[:summary])
    if @novel.save
      @novel.memberships.build(role: novel_params[:membership][:role], user_id: novel_params[:membership][:user_id])
      @novel.save
      # current_user.save
      # @membership = @novel.build(novel_id: @novel.id, user_id: novel_params[:membersh])
      # Membership.new(user_id: current_user.id, novel_id: @novel.id, role: "Admin")
      # raise params.inspect
      # @novel.memberships.last.novel_id = @novel.id
      redirect_to novel_path(@novel)
    else
      render :new
    end
    #current_user.novels.build(novel_params)
    #
  end

  def index
    @user = User.find_by(id: params[:user_id])
    if @user != current_user
      flash[:message] = "You can only view your own novel list."
      # flash[:message] = "You can only view your own novels."
      redirect_to user_path(current_user)
    end
  end

  def show
    @novel = Novel.find_by(id: params[:id])
    if !current_user.member_of?(@novel)
      flash[:message] = "You can only view novels you are a member of."
      redirect_to user_path(current_user)
    # elsif !@novel
    #   flash[:message] = "This novel does not exist."
    #   redirect_to user_path(current_user)
    end
    # redirect_to root_path if !@novel
  end

  def edit
    @novel = Novel.find_by(id: params[:id])
    redirect_to root_path if !@novel
    #add functionality here later so user can only edit their own novel
  end

  def update
    @novel = Novel.find_by(id: params[:id])
    @novel.update(novel_params)
    redirect_to novel_path(@novel)
  end

  def destroy
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
