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
    
  
    
    if doesnt_exist(hunter_params[:hunter_name]) 
    
      if @hunter.save
        session[:hunter_name] = @hunter.hunter_name
        session[:hunter_uuid] = @hunter.hunter_uuid
        session[:hunter_session_id] = @hunter.generate_session_id
        redirect_to hunter_path(@hunter.hunter_uuid)
      else
        render :new
      end
    else
      redirect_to root_path + 'register', message: 'User already exists!'
    end

  end

  def capture
    @hunter = Hunter.find_by_hunter_uuid(params[:hunter_uuid])
    if session[:hunter_session_id] == @hunter.generate_session_id
      @item = item.find_by_item_uuid(params[:item_uuid])
      @hunter.item << @item unless @hunter.item.include?@item
      tweet_capture(@hunter.hunter_name, @item.title)
      redirect_to hunter_path(@hunter.hunter_uuid)
    else
      redirect_to hunter_path(@hunter.hunter_uuid)
    end
  end

  def hunter_params
    params.require(:hunter).permit(:hunter_name, :hunter_uuid, :password, :ghost_uuid)
  end

  def doesnt_exist(hunter_name)
    h = Hunter.find_by_hunter_name(hunter_name)
    if h
      return false
    else
      return true
    end
  end 


end
