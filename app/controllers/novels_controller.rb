class NovelsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @novel = Novel.new
    @membership = @novel.memberships.build
    # @membership = Membership.new
    #@novel = Novel.memberships.build
  end

  def create
    # binding.pry
    @novel = current_user.novels.build(novel_params)
    if @novel.save
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
  end

  def show
    @novel = Novel.find_by(id: params[:id])
    redirect_to root_path if !@novel
  end

  private

  def novel_params
    params.require(:novel).permit(
      :title,
      :summary,
      # :membership,
      membership_attributes: [
        :id,
        :role,
        :user_id
      ] )
    #include membership attributes here membership_attributes: [array of attributes]
  end

end
