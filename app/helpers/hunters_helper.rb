# frozen_string_literal: true

# :nodoc:
module HuntersHelper
  def score(hunter)
    running_score = 0
    hunter.items.each do |item|
      unless item.is_coupon?
        running_score += 10
      end
      return running_score
    end
    
  end

  def generate_session_id(hunter)
    Digest::MD5.hexdigest "#{hunter.hunter_uuid}+ #{hunter.hunter_name}"
  end
end
