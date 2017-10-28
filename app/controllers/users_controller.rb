class UsersController < ApplicationController
  before_action :check_user, only: [:edit, :update]

  def index
    binding.pry
    @users = User.where('name LIKE(?)', "#{params[:keyword]}")
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

  def user_params
    params.require(:)
  end
end
