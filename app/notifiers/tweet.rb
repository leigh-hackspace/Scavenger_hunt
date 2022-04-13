class Tweet
  def self.tweet(message)
    self.new(message).tweet
  end

  def initialize(message)
    @message = message
  end

  def tweet
    return unless ActiveModel::Type::Boolean.new.cast(ENV['SEND_TWEET'])
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        =  ENV['TWITTER_API_KEY']
      config.consumer_secret     =  ENV['TWITTER_SECRET_KEY']
      config.access_token        =  ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret =  ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end

    client.update(message)
  end

  private

  attr_reader :message
end
