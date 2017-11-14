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

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project, notice: "Project has been updated."
    else
      flash.now[:alert] = "Project has not been updated."
      render "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, notice: "Project has been deleted."
  end

  private

  def project_params
  	params.require(:project).permit(:name, :description)
  end
end
