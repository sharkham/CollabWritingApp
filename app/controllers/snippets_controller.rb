class SnippetsController < ApplicationController
  before_action :require_login

  def new
    @snippet = Novel.find_by(id: params[:novel_id]).snippets.build
    if !member_of?(@snippet.novel)
      flash[:message] = "You can only create snippets of novels you are a member of."
      redirect_to user_path(current_user)
    end
  end

  def create
    @snippet = Novel.find_by(id: params[:novel_id]).snippets.build(snippet_params)
    if @snippet.save
      redirect_to novel_snippets_path(@snippet.novel)
    else
      render :new
    end
  end

  def show
    @snippet = Snippet.find_by(id: params[:id])
    if !@snippet
      flash[:message] = "This snippet does not exist."
      redirect_to novel_snippets_path(Novel.find_by(id: params[:novel_id]))
    elsif !member_of?(@snippet.novel)
      flash[:message] = "You can only view novels you are a member of."
      redirect_to user_path(current_user)
    end
  end

  def index
    @novel = Novel.find_by(id: params[:novel_id])
    @snippets = @novel.snippets
    if !member_of?(@novel)
      flash[:message] = "You can only view novels you are a member of."
      redirect_to user_path(current_user)
    end
  end

  def sorted
    # binding.pry
    @novel = Novel.find_by(id: params[:novel_id])
    @snippets = @novel.snippets.where(tag: params[:tag])
    render :index
  end

  def edit
    @snippet = Snippet.find_by(id: params[:id])
    if !@snippet
      flash[:message] = "This snippet does not exist."
      redirect_to novel_snippets_path(Novel.find_by(id: params[:novel_id]))
    elsif !member_of?(@snippet.novel)
      flash[:message] = "You can only edit snippets from novels you are a member of."
      redirect_to user_path(current_user)
    end
  end

  def update
    @snippet = Snippet.find_by(id: params[:id])
    if @snippet.update(snippet_params)
      redirect_to novel_snippet_path(@snippet.novel, @snippet)
    else
      render :edit
    end
  end

  def destroy
    Snippet.find_by(id: params[:id]).destroy
    # binding.pry
    redirect_to novel_snippets_path(Novel.find_by(id: params[:novel_id]))
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :summary, :content, :tag)
  end
end
