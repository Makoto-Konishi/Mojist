class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create, :new]
  def new
    @user = User.new

    if logged_in?
      redirect_to root_url
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to user_url(@user), success: 'サインアップに成功しました'
    else
      flash.now[:alert] = "サインアップに失敗しました"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_url(@user), success: '更新に成功しました'
    else
      flash.now[:alert] = '更新に失敗しました'
      render :edit
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
