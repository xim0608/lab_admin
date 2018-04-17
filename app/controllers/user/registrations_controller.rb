class User::RegistrationsController < User::BaseController
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
          flash.now[:notice] = "登録完了"
          redirect_to after_login_path
        else
          flash.now[:error] = "登録エラー"
          render action: :new
        end
      end
    rescue => e
      p e.message
    end
  end

  def edit
    redirect_to root_path if current_user.id != params[:id].to_i # || current_user == current_user.admin?
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = '更新しました'
      redirect_to root_path
    else
      flash.now[:error] = '更新に失敗しました'
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :slack_uid, :password, :password_confirmation)
    end

    def edit_user_params
      params.require(:user).permit(:email, :slack_uid)
    end      
end
