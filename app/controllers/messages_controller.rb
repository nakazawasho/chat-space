class MessagesController < ApplicationController
  def new
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @messages = @group.messages.includes(:user)
    @message = Message.new
    @users = @group.users
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to new_group_message_path
    else
      set_instance
      render :new
      flash.now[:alert] = "メッサージ送信失敗"
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :image).merge(group_id: params[:group_id])
  end

  def set_instance
      @groups = current_user.groups
      @group = Group.find(params[:group_id])
      @messages = @group.messages
      @users = Group.find(params[:group_id]).users
  end
end
