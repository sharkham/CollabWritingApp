class SnippetsController < ApplicationController
  def new
    @snippet = Novel.find_by(id: params[:novel_id]).snippets.build
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
