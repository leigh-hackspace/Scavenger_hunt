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

<<<<<<< HEAD
  def has_image?
    image.present?
=======
  def is_encrypted_item?
    cipher_text.present?
>>>>>>> Add cipher item for cryptic hunt
  end

  def capture(hunter)
    Capture.the_item(hunter: hunter, item: self)
  end

  private

  def generate_item_uuid
    self.item_uuid = SecureRandom.uuid
  end
end
