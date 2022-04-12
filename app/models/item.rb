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
    if is_bonus_item?
      capture_bonus_item(hunter)
    else
      capture_item(hunter)
    end
  end

  private

  def generate_item_uuid
    self.item_uuid = SecureRandom.uuid
  end

  def capture_bonus_item(hunter)
    return :you_already_have_a_bonus_item if hunter.bonus_item.present?
    return :this_bonus_item_has_already_been_claimed if self.hunters.present?

    hunter.update(bonus_item: self)
    hunter.items << self unless hunter.items.include? self
    :success
  end


  def capture_item(hunter)
    if hunter.items.include? self
      :you_already_have_this_item
    else
      hunter.items << self
      :success
    end
  end
end
