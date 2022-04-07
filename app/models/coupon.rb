class Coupon < ApplicationRecord
  before_save :generate_coupon_code

  def generate_coupon_code
    debugger
    self.coupon_code ||= (0...10).map { ('a'..'z').to_a[rand(26)] }.join     
  end
end
