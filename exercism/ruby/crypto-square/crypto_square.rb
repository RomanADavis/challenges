class Crypto
  attr_accessor :string, :normalized, :length, :rectangle, :cipher_rectangle,
                :cipher, :normalized_cipher
  def initialize(string)
    self.string = string
  end

  def normalize_plaintext
    self.normalized ||= self.string.downcase.scan(/[0-9a-z]+/).join
  end

  def size
    self.length ||= (normalize_plaintext.length ** 0.5).ceil
  end

  def plaintext_segments
    self.rectangle ||= normalize_plaintext.scan(/.{1,#{size}}/)
  end

# There's got to a better way to do this with zip.
  def cipher_segments
    return self.cipher_rectangle if self.cipher_rectangle
    self.cipher_rectangle = (0..plaintext_segments[0].length).map do |index|
      chars = (0..plaintext_segments.length).to_a.map do |j|
        plaintext_segments[j] ? plaintext_segments[j][index] : ""
      end
      chars.join
    end
  end

  def ciphertext
    self.cipher ||= cipher_segments.join
  end

# For some reason, there was a hanging space on the end in some tests, so I
# called strip to fix it, but I'm not sure why.
  def normalize_ciphertext
    self.normalized_cipher ||= cipher_segments.join(" ").strip
  end
end
