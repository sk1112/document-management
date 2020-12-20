class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user

  def show
  end

  def edit
    if @user == current_user
      render action: :edit
    else
      redirect_to root_path
    end
  end

  def update
    if @user.update(user_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def destroy
    redirect_to action: :show unless current_user.id == @user.id
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :department).merge(id: current_user.id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
