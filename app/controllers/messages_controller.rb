class MessagesController < ApplicationController
  before_action :check_message, only: [:new, :create]

  def new
    @message = Message.new
    set_instance
    @update_messages = @group.messages.includes(:user).where('id > ?', params[:last])
    respond_to do |format|
      format.html
      format.json { render 'automatic_updating' ,handlers: 'jbuilder' }
    end
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to new_group_message_path  }
        format.json { render 'success', handers: 'jbuilder' }
      end
    else
      set_instance
      flash.now[:alert] = "メッセージ送信失敗"
      respond_to do |format|
        format.html { render :new  }
        format.json { render 'unsuccess', handlers: 'jbuilder' }
      end
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :image).merge(group_id: params[:group_id])
  end

  def set_instance
      @groups = current_user.groups
      @group = Group.find(params[:group_id])
      @messages = @group.messages.includes(:user)
      @users = Group.find(params[:group_id]).users
  end
end
