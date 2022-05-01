module SessionsHelper
  def set_current_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:id]) 
    end
  end

  def not_login_user
    if @current_user == nil
      redirect_to login_form_path, notice: "ログインが必要です。"
    end
  end

  def login_user
    if @current_user
      redirect_to root_path, notice: "既にログインしています。"
    end
  end
end
