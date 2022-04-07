# frozen_string_literal: true

# :nodoc:
class Hunter < ApplicationRecord
  before_save :generate_hunter_uuid
  has_secure_password
  has_and_belongs_to_many :items
  has_many :coupons

  def generate_session_id
    Digest::MD5.hexdigest "#{hunter_uuid}+ #{hunter_name}"
  end

  def check_admin
    is_admin?
  end

  def score
    running_score = 0
    self.items.each do |item|
      unless item.is_coupon?
        running_score += 10
      end
    end
    return running_score
  end

  def has_coupon
    self.items.each do |i|
      if i.is_coupon
        return true
      end
    end
    return false
  end

  def coupon_code
    unless has_coupon
      return ""
    else
      self.items.each do |item|
        if item.is_coupon?
          return @coupon_code = Coupon.find_by("item_id"=>item.item_uuid).coupon_code
        end
      end
    end
  end

  private

  def generate_hunter_uuid
    self.hunter_uuid = SecureRandom.uuid
  end
end
