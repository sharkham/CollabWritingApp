class MembershipsController < ApplicationController

  def new
    @membership = Novel.find_by(id: params[:novel_id]).memberships.build
  end

  def create
  end

  private

  def membership_params
  end

end
