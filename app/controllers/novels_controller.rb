class NovelsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @novel = Novel.new
  end

  def create
  end

  def index
  end

  private

  def novel_params
    params.require(:novel).permit(:title, :summary)
  end

end
