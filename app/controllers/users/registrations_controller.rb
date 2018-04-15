class Users::RegistrationsController < Users::BaseController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.to_h)
    begin
      User.transaction do
        if @user.valid?
          @user.save!
          flash[:notice] = "登録完了"
          redirect_to after_login_path
        else
          flash[:error] = "登録エラー"
          render action: :new
        end
      end
    rescue => e
      p e.message
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :slack_uid, :password, :password_confirmation)
    end
end
