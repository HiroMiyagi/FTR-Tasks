class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    binding.pry
    if @project.save
      redirect_to :root
    else
      render action: :new
    end
  end
  
  private
  def project_params
    params.require(:project).permit(:name, :job_num, :order_amount, :delivery_date).merge(create_user_id: current_user.id)
  end

end
