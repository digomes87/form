# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def new
    @user = User.new
  end

  def create
    @r = User.create(user_params)

    if @r
      redirect_to new_user_path
    else
      render :new
    end
  end

  def update
    @user.update(user_params)
  end

  private

  def user_params
    # params.permit(:username, :email, :password)
    params.require(:user).permit(:username, :email, :password)
  end

  def edit; end

  def set_user
    @user = User.find(params[:id])
  end
end
