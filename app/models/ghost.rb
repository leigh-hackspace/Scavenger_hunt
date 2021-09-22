class Ghost < ApplicationRecord
  before_save :generate_ghost_uuid

  private

  def generate_ghost_uuid
    self.ghost_uuid = SecureRandom.uuid
  end

end
