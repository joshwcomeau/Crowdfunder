class BreakpointsController < ApplicationController

	def create
		@project = Project.find(params[:project_id])
		@breakpoint = @project.breakpoints.new(breakpoint_params)

		if @breakpoint.save
			redirect_to @project
		else
			# empty for now
		end
	end

end
