class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    #バリデーションで問題があれば、保存はされず「投稿画面」に戻る
    if @user.valid?
      @user.save
      redirect_to new_user_registration_path
    else
      #保存されなければ、newに戻る
      render 'new(@user)'
    end
  end
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
