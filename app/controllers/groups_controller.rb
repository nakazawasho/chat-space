class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループの作成が完了しました。"
    else
      flash.now[:alert] = "グループ作成に失敗しました。"
      render :new
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end
