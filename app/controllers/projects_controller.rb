class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]

  def index
  	@projects = Project.all
  end

  def show
    authorize @project, :show?
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project has been updated."
    else
      flash.now[:alert] = "Project has not been updated."
      render "edit"
    end
  end

  private

  def project_params
  	params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to projects_path, alert: "The project you were looking for could not be found."
  end
end
