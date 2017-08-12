class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def edit
  end

  def create
    binding.pry
    redirect_to controller: :messages, action: :index
  end
end
