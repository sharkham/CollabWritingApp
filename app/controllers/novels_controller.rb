class NovelsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @novel = Novel.new
    @membership = @novel.memberships.build
    # @membership = Membership.new
    #@novel = Novel.memberships.build
  end

  def create
    @novel = Novel.new(novel_params)
    if @novel.save
      redirect_to novel_path(@novel)
    else
      render :new
    end
    #current_user.novels.build(novel_params)
    #
  end

  def index
  end

  def show
    @novel = Novel.find_by(id: params[:id])
    redirect_to root_path if !@novel
  end

  private

  def novel_params
    params.require(:novel).permit(:title, :summary)
    #include membership attributes here membership_attributes: [array of attributes]
  end

end
