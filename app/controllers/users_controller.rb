class UsersController < ApplicationController

  before_action :not_login_user, only: [:show, :index, :edit]
  before_action :login_user, only: [:new, :creates]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_url, notice: "新規登録しました。"
    else
      render :new, status: :unprocessable_entity
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
