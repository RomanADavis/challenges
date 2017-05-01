class Triplet
  attr_accessor :sum, :product
  def initialize(*sides)
    self.sum = sides.inject(:+)
    self.product = sides.inject(:*)
  end
end
