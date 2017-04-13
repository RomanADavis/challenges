squares = Struct.new(:sum_of_squares, :square_of_sum, :difference)

class Squares < squares
  def initialize(n)
    self.square_of_sum = (0..n).inject(:+) ** 2
    self.sum_of_squares = (0..n).map {|n| n ** 2}.inject(:+)
    self.difference = self.square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 3
end
