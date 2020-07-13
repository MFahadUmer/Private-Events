class UsersController < ApplicationController
  def index
    @users  = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    end
  end

  def sign_in
    @user = User.find_by(params[:username])
    if @user.exists?
      redirect_to user_path(@user)
    else
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
