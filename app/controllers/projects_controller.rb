class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update]
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
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
  
  private
  def project_params
    params.require(:project).permit(:name, :job_num, :order_amount, :delivery_date).merge(create_user_id: current_user.id)
  end

  def set_project
    @project = Project.find_by(id: params[:id])
  end
end
