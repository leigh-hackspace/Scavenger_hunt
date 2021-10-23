class Capture < ApplicationRecord
  belongs_to :hunter
  has_many :ghosts
end
