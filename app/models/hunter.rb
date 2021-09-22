class Hunter < ApplicationRecord
  before_save :generate_hunter_uuid

  private

  def generate_hunter_uuid
    self.hunter_uuid = SecureRandom.uuid
  end
end
