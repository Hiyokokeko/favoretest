class UsersController < ApplicationController
  def show
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: 'ユーザー情報を更新しました。'
    else
      render :edit
    end
  end

  parivate
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
