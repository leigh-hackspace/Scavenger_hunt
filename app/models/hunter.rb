class Hunter < ApplicationRecord
  before_save :generate_hunter_uuid
  has_secure_password
  has_and_belongs_to_many :ghosts

  
  private

  def generate_hunter_uuid
    self.hunter_uuid = SecureRandom.uuid
  end
end
