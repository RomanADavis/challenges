# For now, this passes no tests. I'm still trying to figure out the algo.

class TwoBucket
  def initialize(bucket1_size, bucket2_size, goal, first_filled)
    @buckets = [Bucket.new(bucket1_size), Bucket.new(bucket2_size)]
    @goal = goal
    @buckets.reverse! if first_filled == "two"
  end

  def moves
    until @buckets.any? {|bucket| bucket.filled == @goal}
      @buckets.first.fill
      @buckets.first.pour(@buckets.last)
    end
    steps
  end
end

class Bucket # Fraction
  attr_accessor :filled, :size
  def initialize(size) #numerator, denominator
    @filled = 0
    @size = size
  end

  def pour(other)
    @filled -= (other.size - other.filled)
    other.fill(@filled)
  end

  def fill(amount = @size)
    @filled = @filled + amount
    @filled = @size if @filled > @size
  end

  def empty
    @filled = 0
  end
end
