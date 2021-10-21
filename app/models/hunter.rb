class Hunter < ApplicationRecord
  before_save :generate_hunter_uuid
  attr_accessor :score

  private

  def generate_hunter_uuid
    self.hunter_uuid = SecureRandom.uuid
  end
end
