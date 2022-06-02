# frozen_string_literal: true

# :nodoc:
class Hunter < ApplicationRecord
  before_create :generate_hunter_uuid
  has_secure_password
  has_and_belongs_to_many :items
  belongs_to :bonus_item, class_name: "Item", foreign_key: "bonus_item_id", optional: true

  def generate_session_id
    Digest::MD5.hexdigest "#{hunter_uuid}+ #{hunter_name}"
  end

  def check_admin
    is_admin?
  end

  def score
    running_score = 0
    self.items.counted.each do |item|
      running_score += 10
    end
    return running_score
  end

  attr_accessor :confirm_email, :confirmed_email

  private



  def generate_hunter_uuid
    self.hunter_uuid = SecureRandom.uuid
  end
end
