class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to admin_users_url, success: '更新に成功しました'
  end

  def destroy
    user = User.find(params[:id])
    user.destroy!
    redirect_to admin_users_url, notice: 'ユーザーを削除しました'
  end
end
