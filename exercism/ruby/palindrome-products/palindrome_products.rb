class Palindromes
  def initialize(settings={})
    @min_factor = settings.fetch(:min_factor, 1)
    @max_factor = settings[:max_factor]
  end

  def generate
    products = []
    (@min_factor..@max_factor).each do |x|
      (@min_factor..@max_factor).map {|y| x * y}.each {|prod| products << prod}
    end
    @palindromes = products.select {|prod| prod.to_s.reverse.to_i == prod}
  end

  def largest
    Factors.new(@palindromes.max, @min_factor, @max_factor)
  end

  def smallest
    Factors.new(@palindromes.min, @min_factor, @max_factor)
  end
end

class Factors
  attr_accessor :factors, :value
  def initialize(value, min, max)
    self.value = value
    self.factors = (1..(value ** 0.5).floor).select {|f| value % f == 0}
    self.factors.map! {|factor| [factor, value / factor]}
    self.factors.reject! do |pair|
      pair.any? {|factor| factor > max || factor < min}
    end
    self.factors.uniq!
  end
end
