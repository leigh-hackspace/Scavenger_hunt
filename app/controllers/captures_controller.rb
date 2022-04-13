class CapturesController < ApplicationController
  def create
    @hunter = Hunter.find_by(hunter_uuid: params[:hunter_uuid])
    check_valid_session(session[:hunter_session_id], @hunter)
    @item = Item.find_by_item_uuid(params[:item_item_uuid])

    status = @item.capture(@hunter)
    result = Status.decide(status)
    
    if result == 4  
      tweet_capture(@hunter, @item)
    end

    redirect_to item_captures_path(@item, message: result)
  end
end
