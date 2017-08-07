class UsersController < ApplicationController
  def edit
  end

  def update
    User.update(update_params)
  end

  private
  def update_params
    params.require(:user).permit(:name, email:)
  end
end
