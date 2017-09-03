class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def show
    @groups = current_user.groups
    @group = Group.find(params[:id])
    @users = @group.users
    # binding.pry
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: "グループ編集をしました。"
    else
      flash.now[:alert] = "グループ編集に失敗しました。"
      render :edit
    end
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
