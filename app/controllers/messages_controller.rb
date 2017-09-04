class MessagesController < ApplicationController
  def new
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    Message.create(message_params)
    redirect_to new_group_message_path
  end

  private
  def message_params
    params.require(:message).permit(:content, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
