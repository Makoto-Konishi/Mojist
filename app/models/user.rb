class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  # if: -> { new_record? || changes[:crypted_password] }
  # パスワード以外のプロフィール項目を(メールアドレスや名前)を更新したい場合にパスワードの入力を省略
  validates :password, length: { minimum: 5 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
end
