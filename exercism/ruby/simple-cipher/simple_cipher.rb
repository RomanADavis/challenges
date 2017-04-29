class Cipher
  attr_accessor :key

  def self.key
    return @key if @key
    @key = "You should really just change this key"
    @key.downcase!.delete!(' ')
  end

  def encode(string)
    chars = string.chars.map.with_index do |char, index|
      Char.new(char).shift(Char.new(key[index])).value
    end
    chars.join
  end

  def decode(string)
    chars = string.chars.map.with_index do |char, index|
      Char.new(char).deshift(Char.new(key[index])).value
    end
    chars.join
  end

  def initialize(cipher_key = Cipher.key)
    raise ArgumentError unless cipher_key.match(/\A[a-z]+\z/)
    self.key = cipher_key
  end
end

class Char
  LOWER_ALPHA = ('a'..'z').to_a
  UPPER_ALPHA = ('A'..'Z').to_a
  DIGITS = ('0'..'9').to_a
  attr_accessor :value
  def initialize(char)
    raise ArgumentError unless char.is_a?(String) && char.length == 1
    self.value = char
  end

  def lowercase?
    ('a'..'z').include? self.value
  end

  def uppercase?
    ('A'..'Z').include? self.value
  end

  def digit?
    ('0'..'9').include? self.value
  end

  def ==(other)
    self.value == other.value
  end

  def shift(other)
    iterator = Char.new('a')

    output = Char.new(self.value)
    until iterator == other
      iterator = iterator.next
      output = output.next
    end
    output
  end

  def deshift(other)
    first = Char.new('a')

    output = Char.new(self.value)
    until other == first
      other = other.last
      output = output.last
    end
    output
  end


  def next
    return next_sequence(LOWER_ALPHA) if LOWER_ALPHA.include? self.value
    return next_sequence(UPPER_ALPHA) if UPPER_ALPHA.include? self.value
    return next_sequence(DIGITS) if DIGITS.include? self.value
    raise ArgumentError
  end

  def last
    return last_sequence(LOWER_ALPHA) if LOWER_ALPHA.include? self.value
    return last_sequence(UPPER_ALPHA) if LOWER_ALPHA.include? self.value
    return last_sequence(DIGITS) if DIGITS.include? self.value
    raise ArgumentError
  end

  private
  def next_sequence(sequence)
    return Char.new(sequence.first) if self.value == sequence.last
    Char.new(sequence[sequence.find_index(self.value) + 1])
  end

  def last_sequence(sequence)
    return Char.new(sequence.last) if self.value == sequence.first
    Char.new(sequence[sequence.find_index(self.value) - 1])
  end
end
