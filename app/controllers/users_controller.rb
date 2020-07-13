class UsersController < ApplicationController
  def index
    @users = User.all
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
    @user = User.where("username like ?", "#{params[:username]}")
    if @user.exists?
      session[:current_user] = params[:username]
    end
  end

  def user_logout
    session.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
