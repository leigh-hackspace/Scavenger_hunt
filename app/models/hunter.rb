class Hunter < ApplicationRecord
  before_save :generate_hunter_uuid
  has_secure_password
  has_and_belongs_to_many :items


  def generate_session_id
    Digest::MD5.hexdigest "#{self.hunter_uuid}+ #{self.hunter_name}"
  end

  def score
    self.items.count * 10
  end
  private

  def generate_hunter_uuid
    self.hunter_uuid = SecureRandom.uuid
  end


end
