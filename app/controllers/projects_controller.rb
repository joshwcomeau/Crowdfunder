class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all

    @projects.each do |x|
      if x.finish_date == Date.today
        x.destroy
      end 
    end 
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id if current_user
    if @project.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to root_path
    else
      render 'edit'
    end 
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to root_path
  end

  def project_params
    params.require(:project).permit(:name, :description, :start_date, :finish_date, :funding_goal, tiers_attributes: [:id, :amount, :tier_description])
  end
end
