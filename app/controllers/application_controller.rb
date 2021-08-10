class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  # :require_login sorceryが作成するメソッド。ログインしてない時not_authenticatedメソッドを発火する
  before_action :require_login
  def not_authenticated
    redirect_to login_url, danger: 'ログインしてください'
  end
end
