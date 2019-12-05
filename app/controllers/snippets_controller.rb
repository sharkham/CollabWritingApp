class SnippetsController < ApplicationController
  def new
    @snippet = Novel.find_by(id: params[:novel_id]).snippets.build
  end

  def create
    @snippet = Novel.find_by(id: params[:novel_id]).snippets.build
    if @snippet.save
      redirect_to novel_path(@snippet.novel)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
