class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
  end

  def create
    redirect_to new_user_session_path
  end

end