# Took me a while to figure out the algo. Was pretty simple in retrospect, but
# I'm glad I figured it out on my own.

class TwoBucket
  attr_accessor :buckets, :goal, :steps, :goal_bucket
  def initialize(bucket1_size, bucket2_size, goal, goal_bucket)
    self.buckets = [Bucket.new(bucket1_size), Bucket.new(bucket2_size)]
    self.goal = goal
    self.goal_bucket = goal_bucket
    self.buckets.reverse! if goal_bucket == "two"
  end

  def other_bucket
    self.buckets.last.size
  end

  def moves
    self.steps = 0
    until self.buckets.first.filled == self.goal
      fill if self.buckets.first.empty?
      empty if self.buckets.last.full?
      pour
    end
    self.steps
  end

private
  def fill
    self.buckets.first.fill
    self.steps += 1
  end

  def pour
    self.buckets.first.pour(self.buckets.last)
    self.steps += 1
  end

  def empty
    self.buckets.last.empty
    self.steps += 1
  end
end

class Bucket # Fraction
  attr_accessor :filled, :size
  def initialize(size) #numerator, denominator
    self.filled = 0
    self.size = size
  end

  def full?
    self.filled == @size
  end

  def empty?
    self.filled == 0
  end

  def pour(other)
    capacity = other.size - other.filled
    capacity = self.filled if self.filled < capacity
    self.filled -= capacity
    other.fill(capacity)
  end

  def fill(amount = self.size)
    self.filled = self.filled + amount
    self.filled = self.size if self.filled > self.size
  end

  def empty
    self.filled = 0
  end
end

module BookKeeping
  VERSION = 2
end
