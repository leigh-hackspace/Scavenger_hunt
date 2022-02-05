class Item < ApplicationRecord
  before_save :generate_item_uuid
  has_one_attached :image
  has_and_belongs_to_many :hunters

  private

  def generate_item_uuid
    self.item_uuid = SecureRandom.uuid
  end

end
