class Integer
  def factors
    factor  = 2
    factors = [1, self]
    while factor < self**0.5
      factors << factor << self / factor if self % factor == 0
      factor += 1
    end
    factors
  end
end

class Fraction
  attr_accessor :numerator, :denominator
  def initialize(numerator, denominator = 1)
    if numerator.is_a? Fraction
      numerator /= denominator
      self.numerator   = numerator.numerator
      self.denominator = numerator.denominator
    elsif denominator.is_a? Fraction
      numerator = Fraction.new(numerator, 1)
      numerator /= denominator
      self.numerator =  numerator.numerator
      self.denominator = numerator.denominator
    else
      self.numerator   = numerator
      self.denominator = denominator
    end
  end

  def +(other)
    numerator =  self .numerator * other.denominator
    numerator += other.numerator * self .denominator
    denominator = self.denominator * other.denominator
    Fraction.new(numerator, denominator).reduce
  end

  def reduce!
    gcf = (self.numerator.factors & self.denominator.factors).max
    self.numerator   /= gcf
    self.denominator /= gcf
    self
  end

  def reduce
    dup.reduce!
  end

  def *(other)
    other = Fraction(other, 1) if other.is_a? Integer
    numearator = self.numerator * other.numerator
    denominator = self.denominator * other.denominator
    Fraction.new(numerator, denominator)
  end

  def /(other)
    other = Fraction(other, 1) if other.is_a? Interger
    self * Fraction.new(other.denominator, other.numerator)
  end
end

p Fraction.new(1, 1) + Fraction.new(1, 2)
