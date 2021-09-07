class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy]
  def new
    @project = GroupProject.new
    @group = Group.find_by(id: params[:group_id])
  end

  def create
    @project = GroupProject.new(project_group_params)
    if @project.valid?
      @project.save
      redirect_to :root
    else
      render action: :new
    end
  end

  def edit
    
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to :root
    else
      render action: :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to :root
  end
  
  private
  def project_group_params
    params.require(:group_project).permit(:name, :job_num, :order_amount, :delivery_date, :group_id).merge(create_user_id: current_user.id)
  end

  def project_params
    params.require(:project).permit(:name, :job_num, :order_amount, :delivery_date).merge(create_user_id: current_user.id)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
