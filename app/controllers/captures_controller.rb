class CapturesController < ApplicationController
  after_action :tweet, only: :create

  def create
    @hunter = Hunter.find_by(hunter_uuid: params[:hunter_uuid])
    check_valid_session(session[:hunter_session_id], @hunter)
    @item = Item.find_by_item_uuid(params[:item_item_uuid])

    @capture_result = @item.capture(@hunter)
    result = Status.decide(@capture_result)

    redirect_to item_captures_path(@item, message: result)
  end

  def tweet
    CaptureTweet.tweet(
      capture_result: @capture_result,
      item: @item,
      hunter: @hunter
    )
  end
end
