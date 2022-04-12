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

  def capture(hunter)
    begin
      if self.is_bonus_item?
        BonusItem.capture(hunter, self)
      end

      hunter.items << self unless hunter.items.include? self

    rescue => e
      raise e
    end
  end

  private

  def generate_item_uuid
    self.item_uuid = SecureRandom.uuid
  end
end
