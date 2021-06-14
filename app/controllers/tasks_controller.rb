class TasksController < ApplicationController

  def new
    @task = Task.new
    @project = Project.find_by(id: params[:project_id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to :root
    else
      render action: :new
    end
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  private
  
  def task_params
    params.require(:task).permit(:name, :content, :time_limit, :priority_id, :project_id).merge(create_user_id: current_user.id)
  end

end