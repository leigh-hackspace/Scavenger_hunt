# frozen_string_literal: true

# Application controller is responsible for the main functions ... like tweeting etc.
class ApplicationController < ActionController::Base
  before_action :custom_headers

  def check_valid_session(current_session_id, hunter)
    return unless current_session_id == hunter.generate_session_id
  end

  def tweet_capture(hunter, item)
    unless item.is_bonus_item?
      if hunter.items.count <= 2
        send_tweet("Looks like #{hunter.hunter_name} has just found their first item! 🔎#{item.title}🔍️  #EASTEREGGHUNT2022")
      end
    else
      send_tweet("Oh Wow! Looks like #{hunter.hunter_name} has just captured a special bonus item:🔎#{item.title}🔍️! Show the bonus code the staff @CafeCaffeina to receive your bonus!")
    end
  end


  def tweet_user_register(hunter)
    send_tweet("Looks like 🔎#{hunter.hunter_name}🔍 has joined the hunt! ")
  end

  private

  def custom_headers
    response.set_header('X-Clacks-Overhead', 'GNU Terry Pratchett')
  end

  def send_tweet(message)
    return unless ActiveModel::Type::Boolean.new.cast(ENV['SEND_TWEET'])
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        =  ENV['TWITTER_API_KEY']
      config.consumer_secret     =  ENV['TWITTER_SECRET_KEY']
      config.access_token        =  ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret =  ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
    client.update(message)
  end
end
