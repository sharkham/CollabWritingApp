class MembershipsController < ApplicationController
  before_action :require_login

  def new
    @membership = Novel.find_by(id: params[:novel_id]).memberships.build
  end

  def create
    # binding.pry
    @membership = Membership.new(membership_params)
    if @membership.save
      redirect_to novel_path(membership_params[:novel_id])
    else
      render :new
    end
  end

  def index
    @novel = Novel.find_by(id: params[:novel_id])
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
