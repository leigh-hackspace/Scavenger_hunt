# frozen_string_literal: true

# :nodoc:
module CryptoHelper

  def rotate(string, rotation = 1)
    lower = Array('a'..'z')
    rotator = Hash[lower.zip(lower.rotate(rotation))]
    string.chars.map { |c| rotator.fetch(c, " ")}
  end

  def encrypt(string, rotation)
    rotation = rotation % 26
    rotate(string, rotation)
  end

  def decrypt(string, rotation)
    rotation = rotation % 26
    rotate(string, rotation * -1)
  end
end
