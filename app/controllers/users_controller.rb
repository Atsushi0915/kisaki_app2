class UsersController < ApplicationController

  before_action :not_login_user, only: [:show, :index, :edit]
  before_action :login_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url(@user), notice: "新規登録しました。"
    else
      render :new
    end
  end

  def show
  end

  def index
    @users = User.all
  end

  def edit
  end

  private 
    def user_params
      params.require(:user).permit(:name, :email, :icon_image, :password, :password_confirmation)
    end
end
