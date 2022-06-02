# frozen_string_literal: true

# Application controller is responsible for the main functions ... like tweeting etc.
class ApplicationController < ActionController::Base
  before_action :custom_headers

  def check_valid_session(current_session_id, hunter)
    return unless current_session_id == hunter.generate_session_id
  end

  def tweet_user_register(hunter)
    Tweet.tweet("Looks like 👑#{hunter.hunter_name}👑 has joined the hunt! ")
  end

  private

  def custom_headers
    response.set_header('X-Clacks-Overhead', 'GNU Terry Pratchett')
  end
end
