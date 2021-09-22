class HuntersController < ApplicationController
  def index
    @hunters = Hunter.all
  end
  
  def show
    @hunter = Hunter.find(params[:hunter_uuid])
  end

  def new
    @hunter = Hunter.new
  end

  def create
    @hunter = Hunter.new(name: "")
    if @hunter.save
      redirect_to @hunter
    else
      render :new
    end
  end
end
