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
      redirect_to hunter_path(@hunter.hunter_uuid)
    else
      render :new
    end
  end

  def hunter_params
    params.require(:hunter).permit(:hunter_name, :hunter_uuid)
  end
end
