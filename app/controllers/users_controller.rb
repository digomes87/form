# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(id: @user.id)
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(id: @user.id)
    else
      redirect_to users_path
    end
  end

  def index
    @users = User.all
  end

  private

  def user_params
    # params.permit(:username, :email, :password)
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
