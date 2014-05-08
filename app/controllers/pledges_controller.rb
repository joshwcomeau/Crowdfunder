class PledgesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @pledge = @project.pledges.new
  end

  def create
    params[:pledge][:project_id] = params[:project_id]
    @user = current_user
    @pledge = @user.pledges.new(pledge_params)
    if @pledge.save
      redirect_to project_path(params[:project_id])
    else
      redirect_to project_path(params[:project_id]), alert: "Failed to make pledge! D:"
    end
  end


  private

  def pledge_params
    params.require(:pledge).permit(:amount, :tier_id, :user_id, :project_id)
  end
end
