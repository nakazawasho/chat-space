class UsersController < ApplicationController
  def edit
  end


def update
  if current_user.update(update_params)
    redirect_to root_path
  else
    render :edit
  end
end

  private
  def update_params
    params.require(:user).permit(:name, :email)
  end
end
