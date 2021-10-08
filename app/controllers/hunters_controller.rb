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

  def create
    @hunter = Hunter.new(hunter_params)
    @hunter.hunter_uuid = SecureRandom.uuid
    
    if @hunter.save
      session[:hunter_uuid]
      redirect_to root_path
    else
      render :new
    end
  end

  def hunter_params
    params.require(:hunters).permit(:hunter_name)
  end
end
