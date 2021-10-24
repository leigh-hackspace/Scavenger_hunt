module ApplicationHelper
  def logged_in?
    !!session[:hunter_uuid]
  end

  def current_user
    @current_user ||= hunter.find_by_hunter_uuid(session[:hunter_uuid]) if !!session[:hunter_uuid]
  end

  
end
