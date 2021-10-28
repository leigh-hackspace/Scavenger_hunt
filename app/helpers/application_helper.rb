module ApplicationHelper
  def hunter_logged_in?
    !!session[:hunter_uuid]
  end

  def current_user
    @current_user ||= hunter.find_by_hunter_uuid(session[:hunter_uuid]) if !!session[:hunter_uuid]
  end

  def generate_session_id(hunter)
    Digest::MD5.hexdigest "#{hunter.hunter_uuid}+ #{hunter.hunter_name}"
  end
  
end
