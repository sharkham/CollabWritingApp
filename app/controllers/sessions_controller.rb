class SessionsController < ApplicationController

  def new
  end

  def create
  end

  def destroy
    if current_user
      session.delete :user_id
      redirect_to root_path
    end
  end

end
