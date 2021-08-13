class Admin::SessionsController < ApplicationController
  skip_before_action :require_login
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user && @user.admin?
      redirect_to admin_users_url, success: "ログインに成功しました"
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end
  end

end
