class SessionsController < ApplicationController
  def new
	@user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path
    else
      message = "Oops something went wrong! Are your credentials correct?"
      redirect_to login_path, notice: message
    end

  end

end
