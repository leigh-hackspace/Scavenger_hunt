# frozen_string_literal: true

# :nodoc:
class Item < ApplicationRecord
  before_save :generate_item_uuid
  has_one_attached :image
  has_and_belongs_to_many :hunters
  scope :counted, -> { where(code: "") }

  def is_bonus_item?
    code.present?
  end

  def has_image?
    image.present?
  end

  def capture(hunter)
    Capture.the_item(hunter: hunter, item: self)
  end

  private

  def generate_item_uuid
    self.item_uuid = SecureRandom.uuid
  end
end
