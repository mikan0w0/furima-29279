class UsersController < ApplicationController

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
