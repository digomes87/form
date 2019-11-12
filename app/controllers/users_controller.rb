class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
   User.create(params.require(:user).permit(:username, :email, :password))
  end
end
