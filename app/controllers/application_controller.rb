class ApplicationController < ActionController::Base
  before_action :custom_headers

  private

  def custom_headers
    response.set_header('X-Clacks-Overhead', 'GNU Terry Pratchett') 
  end

  def send_tweet(message)
    if ActiveModel::Type::Boolean.new.cast(ENV['SEND_TWEET'])
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        =  ENV['TWITTER_API_KEY']
        config.consumer_secret     =  ENV['TWITTER_SECRET_KEY']
        config.access_token        =  ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret =  ENV['TWITTER_ACCESS_TOKEN_SECRET']
      end
      client.update(message)
    end
  end

  def tweet_capture(hunter_name, hunted_name)
    send_tweet("Looks like #{hunter_name} has just found an item! 🔎#{hunted_name}🔍️  ##{ENV['HUNT_TITLE']}")
  end

end
