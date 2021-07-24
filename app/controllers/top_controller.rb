class TopController < ApplicationController

  def index
    @projects = Project.where(create_user: current_user).order("created_at ASC")

  end

end
