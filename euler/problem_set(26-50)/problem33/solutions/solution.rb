class Fraction
  attr_accessor :numerator, :denominator
  def initialize(numerator, denominator)
    self.numerator, self.denominator = numerator, denominator
  end

  def to_s
    "#{self.numerator} / #{self.denominator}"
  end

  def *(other)
    Fraction.new(self.numerator * other.numerator, self.denominator * other.denominator)
  end

  def ==(other)
    return false unless other.is_a? self.class
    self.numerator == other.numerator && self.denominator == other.denominator
  end

  def reduce_digits?
    canceled = cancel_digits
    return false unless canceled
    self.reduce == cancel_digits.reduce
  end

  def cancel_digits
    common_digits = self.numerator.to_s.chars & self.denominator.to_s.chars
    return nil if common_digits.length != 1 || common_digits == ['0']
    numerator   = (self.numerator.to_s.chars - common_digits)[0].to_i
    denominator = (self.denominator.to_s.chars - common_digits)[0].to_i
    Fraction.new(numerator, denominator)
  end

  def reduce
    gcf = greatest_common_factor
    Fraction.new(self.numerator / gcf, self.denominator / gcf)
  end

  def greatest_common_factor
    (factors(self.numerator) & factors(self.denominator)).max
  end

  def factors(n)
    return [1] if n == 1
    factors = [1, n]
    (2..n).reject {|candidate| candidate > n**0.5}.each do |candidate|
      factors += [candidate, n / candidate] if n % candidate == 0
    end
    factors.sort
  end
end

p Fraction.new(49, 98).reduce_digits?

fractions = []
(12..99).each do |denominator|
  (11..denominator).each do |numerator|
    candidate = Fraction.new(numerator, denominator)
    fractions << candidate if candidate.reduce_digits?
  end
end

p fractions
p fractions.inject(Fraction.new(1, 1)) {|total, fraction| total * fraction}
# => 100
# I feel like I've been trolled.
