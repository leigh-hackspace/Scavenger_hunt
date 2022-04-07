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

  def coupon_code
    self.items.each do |item|
      if item.is_coupon?
        debugger
        @coupon_code = Coupon.find_by("item_id"=>item.uuid).coupon_code
      end
    end
  end

  private

  def generate_hunter_uuid
    self.hunter_uuid = SecureRandom.uuid
  end
end
