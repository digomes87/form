class UsersController < ApplicationController
  def new
    @r = User.new
  end

  def create
    @r = User.create(user_params)

   if @r
    redirect_to new_user_path
   else
    render :new
   end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
