class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:edit,:show]
  before_action :admin_require

  def index
    @users = User.all
  end

  def show
    @user
  end

  def new
    @user = User.new
  end

  def edit
    @user
  end

  def create
    p session[:user_id]
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      p session[:user_id]
      redirect_to admin_user_path(@user), notice: "#{@user.name}さんのアカウントを登録しました。"
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "ユーザー#{@user.name}を削除しました。"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  # def upadate_params
  #   params.require(:user).permit(:name, :email, :password, :password, :password_confirmation)
  # end

  def set_user
    @user = User.find(params[:id])
  end

  def admin_require
    redirect_to root_path unless current_user.admin?
  end

  def sign_in(user)
    session[:user_id] = user.id
  end
end
