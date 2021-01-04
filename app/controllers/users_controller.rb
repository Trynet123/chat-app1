class UsersController < ApplicationController
  def edit
    # @user = User.find(user_params)
  end

  def update
  #   user.update(@user)
  # ・更新に成功するとチャット画面に遷移する
    if current_user.update(user_params)
      redirect_to root_path
    else
      # ・更新に失敗するとeditページに戻ってくる
      render :edit
    end
  end

  private
  def user_params
  #   params.require(:user).permit(name[:id])
    params.require(:user).permit(:name, :email)
  end
end