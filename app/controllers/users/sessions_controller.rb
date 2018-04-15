class Users::SessionsController < Users::BaseController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params.to_h)

    if @user_session.save
      flash[:notice] = "ログインしました。"
      redirect_to after_login_path
    else
      render action: :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "ログアウトしました。"
    redirect_to root_url
  end

  private

    def user_session_params
      params.require(:user_session).permit(:email, :password)
    end
end
