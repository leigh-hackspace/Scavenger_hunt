class HuntersController < ApplicationController
  def all
    @hunters = Hunter.all
  end
  
  def show
    @hunter = Hunter.find_by_hunter_uuid(params[:hunter_uuid])
  end

  def new
    @hunter = Hunter.new
  end

  def create
    @hunter = Hunter.new(hunter_params)
    @hunter.hunter_uuid = SecureRandom.uuid
    
    if @hunter.save
      session[:hunter_name] = @hunter.hunter_name
      session[:hunter_uuid] = @hunter.hunter_uuid
      redirect_to hunter_path(@hunter.hunter_uuid)
    else
      render :new
    end
  end

  def capture
    @hunter = Hunter.find_by_hunter_uuid(params[:hunter_uuid])
    if session[:hunter_session_id] == generate_session_id(@hunter)
      @ghost = Ghost.find_by_ghost_uuid(params[:ghost_uuid])
      @hunter.ghosts << @ghost unless @hunter.ghosts.include?@ghost
      tweet_capture(@hunter.hunter_name, @ghost.title)
      redirect_to hunter_path(@hunter.hunter_uuid)
    else
      redirect_to hunter_path(@hunter.hunter_uuid)
    end
  end

  def hunter_params
    params.require(:hunter).permit(:hunter_name, :hunter_uuid, :password, :ghost_uuid)
  end
end
