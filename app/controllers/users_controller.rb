class UsersController < ApplicationController
  before_action :check_user, only: [:edit, :update]

  def index
    user_ids = params[:chat_group_users_ids].map(&:to_i)
    @users = User.search_with_keyword(params[:keyword]).not_search_with_id(user_ids)
    respond_to do |format|
      format.html
      format.json { render 'users', handlers: 'jbuilder' }
    end
  end

  def create

    if env['omniauth.auth'].present?
        # Facebookログイン
        @user  = User.from_omniauth(env['omniauth.auth'])
        result = @user.save(context: :facebook_login)
        fb       = "Facebook"
    else
        # 通常サインアップ
        @user  = User.new(strong_params)
        result = @user.save
        fb       = ""
    end
    if result
        sign_in @user
        flash[:success] = "#{fb}ログインしました。"
        redirect_to @user
    else
        if fb.present?
            redirect_to auth_failure_path
        else
            render 'new'
        end
    end
  end

  def edit
  end

  def update
    if current_user.update(update_params)
      redirect_to root_path
    else
      flash.now[:alert] = "名前とメールアドレスを正確に入力してください。"
      render :edit
    end
  end

  private
  def update_params
    params.require(:user).permit(:name, :email)
  end
end
