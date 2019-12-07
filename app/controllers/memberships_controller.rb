class MembershipsController < ApplicationController

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

  private

  def membership_params
    params.require(:membership).permit(:user_id, :novel_id, :role)
  end

end
