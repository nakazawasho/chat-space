class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:acount_update, keys: [:name])
  end

  def check_group
    if Group.where(id: params[:id]).empty?
      redirect_to root_path, alert: "そのグループは存在しません"
    elsif Group.find(params[:id]).members.where(group_id: params[:id], user_id: current_user.id).empty?
      redirect_to root_path, alert: "所属していないグループについて操作しようとしています。"
    else
    end
  end

  def check_user
    if User.where(id: params[:id]).empty?
      redirect_to root_path, alert: "そのユーザーは存在しません"
    end
  end

  def check_message
    if Group.where(id: params[:group_id]).empty?
      redirect_to root_path, alert: "そのグループは存在しません"
    elsif Group.find(params[:group_id]).members.where(group_id: params[:group_id], user_id: current_user.id).empty?
      redirect_to root_path, alert: "所属していないグループにアクセスしようとしています"
    else
    end
  end
end
