class User::SessionsController < User::BaseController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params.to_h)

    if @user_session.save
      flash.now[:notice] = "ログインしました。"
      redirect_to root_path
    else
      flash.now[:error] = "ログインに失敗しました。"
      render action: :new
    end
  end

  def destroy
    current_user_session.destroy
    flash.now[:notice] = "ログアウトしました。"
    redirect_to root_path
  end

  private

    def user_session_params
      params.require(:user_session).permit(:email, :password)
    end
end
