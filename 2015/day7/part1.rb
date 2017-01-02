environment = {}

class Circuit
  def initialize()
    self.environment = {}
  end

  def set(variable, value)
    value = evaluate(value)
    self.environment[variable.to_sym] = value if value
  end

  def evaluate(value)
    return value if value.is_a? Integer
    evaluate(self.environment[value])
  end

  def bnot(value)

  end
end

class Integer
  def to_16bit_s
    self.to_s.rjust(16, "0")
  end

  def bnot
    self.to_16bit_s.chars.map {|bit| bit.zero? ? "1": "0"}.to_i
  end

  def band(other)
    result = self.to_16bit_s.chars.map.with_index do |bit, index|
      bit.zero? && other[index].zero? "0": "1"
    end
    result.to_i
  end

  def bor(other)
    self.to_16bit_s.chars.map.with_index do |bit, index|
      bit.zero? || other[index].zero? "0": "1"
    end
  end

  def lsh
end
