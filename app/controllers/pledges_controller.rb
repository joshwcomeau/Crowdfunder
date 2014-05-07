class PledgesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @pledge = @project.pledges.new
  end

  def create

  end
end
