# frozen_string_literal: true

# :nodoc:
class Hunter < ApplicationRecord
  before_save :generate_hunter_uuid
  has_secure_password
  has_and_belongs_to_many :items

  def generate_session_id
    Digest::MD5.hexdigest "#{hunter_uuid}+ #{hunter_name}"
  end

  def score
    items.count * 10
  end

  def check_admin
    isAdmin?
  end

  private

  def generate_hunter_uuid
    self.hunter_uuid = SecureRandom.uuid
  end
end
