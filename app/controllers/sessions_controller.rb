class SessionsController < ApplicationController

	def new
		if !logged_in?
      @user = User.new
      render 'new'
    end

	end

  def create
    @user = User.find_by(username: login_params[:username])
    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @error = "Invalid username or password"
      render 'new'
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
	end

	private  
  def login_params
    params.require(:user).permit(:username, :password)
	end
end