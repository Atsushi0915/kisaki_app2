class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      redirect_to root_path, notice: "ログインしました。"
    else
      flash.notice = "ログイン失敗しました。"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice:"ログアウトしました。"
  end

  private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
