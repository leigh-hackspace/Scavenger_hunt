class CipherItem < ApplicationRecord
  has_one :hunter

  def get_cipher_text
    self.cipher_text
  end

  def set_cipher_text(text) # insert plain text
    self.cipher_text = encrypt_text(text, rotation)
  end

  private

  def rotate_text(plain_text, r)
    alpha = Array('a'..'z')
    upper = Array('A'..'Z')
    symbol = { ";" =>";", "." => ".", "," => ",", ":" => ":", "!" => "!", "<" => "<", ">" => ">" } # we want to keep these the same
    r = r.to_i
    encrypter = Hash[alpha.zip(alpha.rotate(r))]
    upper_encrypter = Hash[upper.zip(upper.rotate(r))]
    encrypter.merge!(upper_encrypter)
    encrypter.merge!(Hash[symbol])
    plain_text.chars().map { |c| encrypter.fetch(c, " ") }.join
  end

  def encrypt_text(text, r)
    self.cipher_text = rotate_text(text, r)
  end

  def decrypt_text(text, r)
    r = r * -1
    rotate_text(text, r)
  end
  
end
