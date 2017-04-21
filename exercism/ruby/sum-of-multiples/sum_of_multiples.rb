class SumOfMultiples < Struct.new(:factors)
  def initialize(*factors)
    self.factors = factors
  end

  def multiples(value)
    (0...value).to_a.select {|i| self.factors.any? {|f| i % f == 0} }
  end

  def to(value)
    multiples(value).inject(:+)
  end
end

p SumOfMultiples.new(5, 3).multiples(10)
