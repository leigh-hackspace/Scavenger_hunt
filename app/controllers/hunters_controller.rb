# frozen_string_literal: true

# Hunters class responsible for creating new sessions and capturing things
class HuntersController < ApplicationController
  def index
    @hunters = Hunter.all
  end

  def show
    @hunter = Hunter.find_by_hunter_uuid(params[:hunter_uuid])
  end

  def new
    @hunter = Hunter.new
  end

  def assign_session(session, hunter)
    session[:hunter_name] = hunter.hunter_name
    session[:hunter_uuid] = hunter.hunter_uuid
    session[:hunter_session_id] = hunter.generate_session_id
    session[:is_admin] = hunter.is_admin?
    redirect_to hunter_path(@hunter.hunter_uuid)
  end

  def create
    unless hunter_params[:confirmed_email].empty?
      message = "bye bye bot"
      redirect_to root_path, notice: message
    else
      if emails_match
        @hunter = Hunter.new(hunter_params)
        if doesnt_exist(hunter_params[:hunter_name])
          if @hunter.save
            tweet_user_register(@hunter)
            assign_session(session, @hunter)
          else
            render :new
          end
        else
          redirect_to "#{root_path}register", message: 'User already exists!'
        end
      else
        redirect_to "#{root_path}register", message: 'Emails do not match!'
      end
    end
  end

  def emails_match
    hunter_params[:email] == hunter_params[:confirm_email]
  end

  def hunter_params
    params.require(:hunter).permit(:hunter_name, :hunter_uuid, :password, :item_uuid, :email, :confirm_email, :confirmed_email)
  end

  def doesnt_exist(hunter_name)
    h = Hunter.find_by_hunter_name(hunter_name)
    if h
      false
    else
      true
    end
  end
end
