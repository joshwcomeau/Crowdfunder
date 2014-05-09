class PledgesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @pledge = @project.pledges.new

  end

  def create

    @project = Project.find(params[:project_id])
    params[:pledge][:project_id] = params[:project_id]
    
    @user = current_user
    @tier = Tier.find(params[:pledge][:tier_id])
    

    @pledge = @user.pledges.new(pledge_params)
    if @pledge.save
      if @project.funded
        funded = @project.funded + @pledge.amount
      else
        funded = @pledge.amount
      end
      @project.update_column(:funded, funded) 

      @tier_backed = @tier.pledges.inject(0) {|sum, pledge| sum + pledge.amount}

      @new_values = {
        msgHeader: "Pledge Confirmed!",
        msg: "Thank you! You have successfully backed this project.",
        tierID: params[:pledge][:tier_id],
        funded: funded,
        tierSum: @tier_backed,
        backers: @tier.pledges.count
      }

    else
      @new_values = { msg: "Failure! Oh" }
    end

    respond_to do |format|
      format.html {  }
      format.json { 
        render :json => @new_values

      }
      format.js {  }
    end


  end


  private

  def pledge_params
    params.require(:pledge).permit(:amount, :tier_id, :user_id, :project_id)
  end
end
