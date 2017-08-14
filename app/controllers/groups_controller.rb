class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    # binding.pry
    Group.create(group_params)
    # binding.pry
    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:name, {"user_ids" => []})
  end

end
