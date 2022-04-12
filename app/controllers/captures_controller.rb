class CapturesController < ApplicationController
  def create
    begin
      @hunter = Hunter.find_by(hunter_uuid: params[:hunter_uuid])
      check_valid_session(session[:hunter_session_id], @hunter)
      @item = Item.find_by_item_uuid(params[:item_item_uuid])

      status = @item.capture(@hunter)

      case status
      when :this_bonus_item_has_already_been_claimed
        status = 1
      when :you_already_have_a_bonus_item
        status = 2
      when :you_already_have_this_item
        status = 3
      when :success
        status = 4
        tweet_capture(@hunter, @item)
      else
        status = 5
      end

      redirect_to item_captures_path(@item, message: status)
    end
  end
end
