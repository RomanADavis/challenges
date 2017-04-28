class Triangle
  attr_accessor :sides
  def initialize(sides)
    self.sides = sides
  end

  def degenerate?
    self.sides.any? {|side| side.zero?}
  end

  def illegal? #triangle inequality
    self.sides.min * 2 < self.sides.max
  end

  def equilateral?
    return false if degenerate? || illegal?
    self.sides.uniq.length == 1
  end

  def isosceles?
    return false if degenerate? || illegal?
    equilateral? || self.sides.uniq.length == 2
  end

  def scalene?
    return false if degenerate? || illegal?
    self.sides.uniq.length == 3
  end
end

class BookKeeping
  VERSION = 1
end
