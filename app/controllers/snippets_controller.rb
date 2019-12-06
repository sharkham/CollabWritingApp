class SnippetsController < ApplicationController
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

  def edit
    @snippet = Snippet.find_by(id: params[:snippet_id])
    redirect_to novel_path(Novel.find_by(id: params[:novel_id])) if !@snippet
  end

  def update
  end

  def destroy
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :summary, :content, :tag)
  end
end
