class Coupon < ApplicationRecord
  before_save :generate_coupon_code
  belongs_to :items

  def generate_coupon_code
    self.coupon_code = (0...10).map { ('a'..'z').to_a[rand(26)] }.join
    @coupon = Coupon.find_by("coupon_code" => self.coupon_code)
     
  end
end
