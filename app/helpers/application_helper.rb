# frozen_string_literal: true

# :nodoc:
module ApplicationHelper
  def hunter_logged_in?
    !!session[:hunter_uuid]
  end

  def current_user
    @current_user ||= Hunter.find_by_hunter_uuid(session[:hunter_uuid]) if !!session[:hunter_uuid]
  end
end
