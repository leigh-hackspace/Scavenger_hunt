module HuntersHelper
  def score(hunter)
    hunter.items.count * 10
  end

  def generate_session_id(hunter)
    Digest::MD5.hexdigest "#{hunter.hunter_uuid}+ #{hunter.hunter_name}"
  end
end
