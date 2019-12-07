class SnippetsController < ApplicationController
  before_action :require_login

  def new
    @snippet = Novel.find_by(id: params[:novel_id]).snippets.build
  end

  def create
    @snippet = Novel.find_by(id: params[:novel_id]).snippets.build(snippet_params)
    if @snippet.save
      redirect_to novel_path(@snippet.novel)
    else
      render :new
    end
  end

  def show
    @snippet = Snippet.find_by(id: params[:id])
  end

  def index
    @novel = Novel.find_by(id: params[:novel_id])

  end

  def edit
    @snippet = Snippet.find_by(id: params[:id])
    redirect_to novel_path(Novel.find_by(id: params[:novel_id])) if !@snippet
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
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :summary, :content, :tag)
  end
end
