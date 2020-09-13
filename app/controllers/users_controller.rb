class UsersController < ApplicationController

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'カタカナを使用してください' } do
    validates :first_kana
    validates :last_kana
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて6文字以上で設定してください'

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end

end
