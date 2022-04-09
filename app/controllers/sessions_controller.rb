# frozen_string_literal: true

# :nodoc:
class SessionsController < ApplicationController
  def new
    @hunter = Hunter.new
  end

  def create
    @hunter = Hunter.find_by(hunter_name: params[:hunter_name])
    if !@hunter.nil? && @hunter.authenticate(params[:password])
      create_session(@hunter)
      redirect_to hunter_path(@hunter.hunter_uuid), notice: 'Logged in'
    else
      message = 'Oops something went wrong! Are your credentials correct?'
      redirect_to login_path, notice: message
    end
  end

  def destroy
    reset_session
    message = 'Logged out!'
    redirect_to login_path, notice: message
  end

  private

  def create_session(hunter)
    session[:hunter_id] = hunter.id
    session[:hunter_name] = hunter.hunter_name
    session[:hunter_uuid] = hunter.hunter_uuid
    session[:hunter_session_id] = hunter.generate_session_id
    session[:is_admin] = hunter.is_admin?
  end
end
