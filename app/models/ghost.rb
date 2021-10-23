class Ghost < ApplicationRecord
  before_save :generate_ghost_uuid
  has_one_attached :image
  belongs_to :capture

  private

  def generate_ghost_uuid
    self.ghost_uuid = SecureRandom.uuid
  end

end
