class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def edit
  end

  def create
    created_group = Group.create(name: create_group_params[:name])

    create_user_id_params[:user_ids].each do |user_id|
      Member.create(group_id: created_group.id, user_id: user_id)
    end

    redirect_to controller: :messages, action: :index
  end

  private
  def create_group_params
    params.require(:chat_group).permit(:name)
  end

  def create_user_id_params
    params.require(:group)
  end
end
