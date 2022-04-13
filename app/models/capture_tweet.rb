class CaptureTweet
  def self.tweet(capture_result:, item:, hunter:)
    self.new(capture_result, item, hunter).tweet
  end

  def initialize(capture_result, item, hunter)
    @capture_result = capture_result
    @item = item
    @hunter = hunter
  end

  def tweet
    if capture_result == :success
      send_tweet
    end
  end

  private

  attr_reader :capture_result, :item, :hunter

  def send_tweet
    return unless capture_result == :success
    if item.is_bonus_item?
      bonus_tweet
    else
      item_tweet
    end
  end

  def bonus_tweet
    Tweet.tweet("Oh Wow! Looks like #{hunter.hunter_name} has just captured a special bonus item:🔎#{item.title}🔍️! Show the bonus code the staff @CafeCaffeina to receive your bonus!")
  end

  def item_tweet
    if hunter.items.count <= 2
      Tweet.tweet("Looks like #{hunter.hunter_name} has just found their first item! 🔎#{item.title}🔍️  #EASTEREGGHUNT2022")
    end
  end
end
