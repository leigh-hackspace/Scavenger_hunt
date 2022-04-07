# frozen_string_literal: true

# :nodoc:
class Item < ApplicationRecord
  before_save :generate_item_uuid
  has_one_attached :image
  has_and_belongs_to_many :hunters
  has_one :coupon

  def is_coupon
    @coupon = Coupon.find_by("item_id"=>self.item_uuid)
    if @coupon
      return true
    end
    return false
  end

  def is_claimed_coupon
    if is_coupon
      @coupon = Coupon.find_by("item_id"=>self.item_uuid)
      return @coupon.is_claimed?
    end
    return false
  end


  private

  def generate_item_uuid
    self.item_uuid = SecureRandom.uuid
  end
end
