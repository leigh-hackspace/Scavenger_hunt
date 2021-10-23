class Hunter < ApplicationRecord
  before_save :generate_hunter_uuid
  has_secure_password
  has_many :captures
  has_many :ghosts, through: :captures

  
  private

  def generate_hunter_uuid
    self.hunter_uuid = SecureRandom.uuid
  end
end
