class GroupsController < ApplicationController

  def index

  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    user = User.find(@group.create_user_id)
    if @group.save
      @group.users << user
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @projects = Project.where(id: GroupProjectRelation.where(group_id: @group.id).map { |h| h[:project_id] }).order("created_at ASC")
  end

  private

  def group_params
    params.require(:group).permit(:name).merge(create_user_id: current_user.id)
  end

end
