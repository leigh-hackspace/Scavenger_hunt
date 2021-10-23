class Ghost < ApplicationRecord
  before_save :generate_ghost_uuid
  has_one_attached :image
  has_and_belongs_to_many :hunters

  private

  def generate_ghost_uuid
    self.ghost_uuid = SecureRandom.uuid
  end

end
