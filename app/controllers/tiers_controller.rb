class BreakpointsController < ApplicationController

	def create
		@project = Project.find(params[:project_id])
		@tier = @project.tiers.new(tier_params)

		if @tier.save
			redirect_to @project
		else
			# empty for now
		end
	end

end
