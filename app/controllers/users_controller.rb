class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    redirect_to new_user_session_path
  end

end