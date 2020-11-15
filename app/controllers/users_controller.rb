class UsersController < ApplicationController

  def new
  end

  def create
    redirect_to new_user_session_path
  end

end