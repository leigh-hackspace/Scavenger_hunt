class CapturesController < ApplicationController
  def create
    @hunter = Hunter.find_by(hunter_uuid: params[:hunter_uuid])
    check_valid_session(session[:hunter_session_id], @hunter)
    @item = Item.find_by_item_uuid(params[:item_item_uuid])

    status = @item.capture(@hunter)
    status = decide_status(status)

    redirect_to item_captures_path(@item, message: status)
  end

  private

  def decide_status(status)
    case status
    when :this_bonus_item_has_already_been_claimed
      1
    when :you_already_have_a_bonus_item
      2
    when :you_already_have_this_item
      3
    when :success
      4
      tweet_capture(@hunter, @item)
    else
      5
    end
  end
end
