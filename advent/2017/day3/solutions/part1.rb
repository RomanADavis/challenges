# --- Day 3: Spiral Memory ---
#
# You come across an experimental new kind of memory stored on an infinite
# two-dimensional grid.
#
# Each square on the grid is allocated in a spiral pattern starting at a
# location marked 1 and then counting up while spiraling outward. For example,
# the first few squares are allocated like this:
#
# 17  16  15  14  13
# 18   5   4   3  12
# 19   6   1   2  11
# 20   7   8   9  10
# 21  22  23---> ...
# While this is very space-efficient (no squares are skipped), requested data
# must be carried back to square 1 (the location of the only access port for
# this memory system) by programs that can only move up, down, left, or right.
# They always take the shortest path: the Manhattan Distance between the
# location of the data and square 1.

class Ulam
  attr_accessor :spiral, :value, :goal

  def initialize(goal)
    self.value = 1
    self.spiral = [[self.value]]
    self.goal = goal
    until self.value >= self.goal
      east
      north
      west
      south
    end
  end

  def east
    loop do
      self.value += 1
      self.spiral[-1] << self.value
      break if self.spiral.last.length > self.spiral.first.length || spiral.length < 2
    end
  end

  def north
    self.spiral[0...-1].reverse.each do |row|
      self.value += 1
      row << self.value
    end

    self.spiral.unshift([self.value += 1])
  end

  def west
    loop do
      self.value += 1
      self.spiral[0].unshift(self.value)
      break if self.spiral.first.length > self.spiral.last.length
    end
  end

  def south
    self.spiral[1..-1].each do |row|
      self.value += 1
      row.unshift(self.value)
    end

    self.spiral << [self.value += 1]
  end

  def print
    page = ""
    self.spiral.each do |row|
      row.each do |cell|
        page += "#{cell}\t"
      end
      page += "\n"
    end

    page
  end

  def manhattan_distance
    center = self.spiral.find_index {|row| row.include?(1)}

    x = self.spiral.find_index {|row| row.include?(self.goal)}
    y = self.spiral[x].find_index(self.goal)

    (x - center).abs + (y - center).abs
  end
end


p Ulam.new(1).manhattan_distance

p Ulam.new(12).manhattan_distance

p Ulam.new(23).manhattan_distance

p Ulam.new(1024).manhattan_distance

p Ulam.new(265149).manhattan_distance
