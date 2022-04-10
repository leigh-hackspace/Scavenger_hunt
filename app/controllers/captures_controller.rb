class CapturesController < ApplicationController
  def create
    begin
      @hunter = Hunter.find_by(hunter_uuid: params[:hunter_uuid])
      check_valid_session(session[:hunter_session_id], @hunter)
      @item = Item.find_by_item_uuid(params[:item_item_uuid])

      @item.capture(@hunter)
      tweet_capture(@hunter, @item.title)

      redirect_to item_captures_path(@item, message: true)
    rescue => e
      redirect_to item_captures_path(@item, message: e)
    end
  end
end
