class SessionsController < ApplicationController
  def new
    @hunter = Hunter.new
  end

  def create
    @hunter = Hunter.find_by(hunter_name: params[:hunter_name])
    if !!@hunter && @hunter.authenticate(params[:password])
      session[:hunter_id] = @hunter.id
      session[:hunter_name] = @hunter.hunter_name
      session[:hunter_uuid] = @hunter.hunter_uuid
      session[:hunter_session_token] =  generate_session_id(@hunter)
      redirect_to hunter_path(@hunter.hunter_uuid), notice: 'Logged in'
    else
      message = "Oops something went wrong! Are your credentials correct?"
      redirect_to login_path, notice: message
    end
  
  end

  def destroy
    reset_session
  end

end
