class Rank
  attr_accessor :letter, :value, :royal
  def initialize(name, value = nil, royal = false)
    raise ArgumentError if letter != letter.to_s.to_i && !value
    self.letter = letter
    self.value = value
    self.royal = royal
  end

  def royal
    self.royal
  end

  def <(other)
    self.value < other.value
  end

  def >(other)
    self.value > other.value
  end

  def ==(other)
    self.value == other.value
  end

  def !=(other)
    !(self == other)
  end

  def to_s
    self.name
  end
end
