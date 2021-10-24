class ApplicationController < ActionController::Base
  before_action :custom_headers

  private

  def custom_headers
    response.set_header('X-Clacks-Overhead', 'GNU Terry Pratchett') 
  end

  def tweet_capture(hunter_name, ghost_name)
    if ActiveModel::Type::Boolean.new.cast(ENV['SEND_TWEET'])
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        =  ENV['TWITTER_API_KEY']
        config.consumer_secret     =  ENV['TWITTER_SECRET_KEY']
        config.access_token        =  ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret =  ENV['TWITTER_ACCESS_TOKEN_SECRET']
      end
      client.update("Looks like #{hunter_name} has just captured a ghost! 👻#{ghost_name}👻 #spookyhunt2021 ")
    end

  end

end
