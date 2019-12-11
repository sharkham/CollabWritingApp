class MembershipsController < ApplicationController
  before_action :require_login

  def new
    @novel = Novel.find_by(id: params[:novel_id])
    if !@novel
      flash[:message] = "This novel does not exist."
      redirect_to user_path(current_user)
    elsif !admin_of?(@novel)
      flash[:message] = "You can only create memberships for novels you are an Admin of."
      redirect_to novel_path(@novel)
    else
      @membership = @novel.memberships.build
      @users = User.not_members(params[:novel_id])
    end

  end

  def create
    # binding.pry
    @membership = Membership.new(membership_params)
    if @membership.valid? && @membership != nil
      @membership.save
      #there's an error for if there are no more eligible members here, figure out how to get rid of.
      redirect_to novel_path(membership_params[:novel_id])
    else
      render :new
    end
  end

  def index
    @novel = Novel.find_by(id: params[:novel_id])
    if !@novel
      flash[:message] = "This novel does not exist."
      redirect_to user_path(current_user)
    end
  end

  def edit
    # @membership = Membership.find_by(id: )
  end

  def update
  end

  def destroy
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id, :novel_id, :role)
  end

end
