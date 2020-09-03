class Public::UsersController < ApplicationController
  before_action :set_user
  before_action :independent_of_admin

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to tasks_path, notice: "ユーザー#{@user.name}を更新しました。"
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def independent_of_admin
    redirect_to root_path if current_user.admin?
  end

end
