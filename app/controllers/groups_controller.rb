class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    # binding.pry
    if @group
      redirect_to root_path
    else
      redirect_to new_group_path
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, {"user_ids" => []})
  end

end
