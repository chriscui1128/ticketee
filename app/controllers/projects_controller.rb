class ProjectsController < ApplicationController
  def index
  	@projects = Project.all
  end
  
  def new
    @project = Project.new
  end

  def create
  	@project = Project.new(project_params)
  	if @project.save
  	  # Category 1
  	  flash[:notice] = 'Project has been created.'
  	  redirect_to @project
  	  # Category 2
  	  # redirect_to @project, notice: 'Project has been created'
  	  # redirect_to @project, alert: 'Project has been created with alert'
  	  # Category 3
  	  # redirect_to @project, flash: { success: 'Project has been created' } 
  	else
  	  flash.now[:alert] = "Project has not been created."
  	  render "new"
  	end
  end

  def show
  	@project = Project.find(params[:id])
  end

  private

  def project_params
  	params.require(:project).permit(:name, :description)
  end
end
