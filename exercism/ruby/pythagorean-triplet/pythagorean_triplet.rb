class Triplet
  attr_accessor :sides, :sum, :product
  def self.where(**options)
    max = options[:max_factor]
    triplets = []
    (1..max).each do |c| # There's got to be a better way to do this.
      (1..c).each do |b|
        (1..b).each do |a|
          triplet = self.new(a, b, c)
          triplets << triplet if triplet.pythagorean?
        end
      end
    end
    triplets
  end

  def initialize(*sides)
    self.sides = sides
    self.sum = sides.inject(:+)
    self.product = sides.inject(:*)
  end

  def pythagorean?
    hypotenuse = self.sides.max
    bases = self.sides - [hypotenuse]
    return false unless bases #equilateral triangles
    bases.map {|base| base ** 2}.inject(:+) == hypotenuse ** 2
  end
end
