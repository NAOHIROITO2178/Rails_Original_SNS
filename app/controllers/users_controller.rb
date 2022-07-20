class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) #どのユーザーを見せるのか
  end

  def edit
    @user = User.find(params[:id]) #どのユーザーを編集するのか
    if @user != current_user
        redirect_to users_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "更新に成功しました。"
    else
      render :edit
    end
  end

  private #セキュリティに強くなる
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end

end

# コントローラーやビュー以外を変更したらサーバーを一回落として再起動する