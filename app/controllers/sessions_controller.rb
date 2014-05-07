class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to projects_path, notice: "Logged in!"
    else
      render :new, alert: "Email or password was invalid." 
    end
  end
  def destroy
    logout
    redirect_to root_url
  end

  private
  def session_params
    params.require(:session).permit(:email, :password, :remember_me)
  end
end
