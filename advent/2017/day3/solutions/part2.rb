# --- Part Two ---
#
# As a stress test on the system, the programs here clear the grid and then
# store the value 1 in square 1. Then, in the same allocation order as shown
# above, they store the sum of the values in all adjacent squares, including
# diagonals.

class Ulam
  attr_accessor :spiral, :value, :goal, :x, :y

  def initialize(goal)
    self.value = 1
    self.x = self.y = 0
    self.spiral = [[self.value]]
    self.goal = goal
  end

  def run
    until self.spiral[0][0] >= self.goal
      east
      north
      west
      south
    end

    self
  end

  def solve
    run
    prospects = []
    self.spiral.each do |row|
      prospects += row.select {|cell| cell > self.goal}
    end

    prospects.min
  end

  def east
    loop do
      behind = self.spiral[self.y][self.x]
      top = self.spiral.length > 1 ? self.spiral[self.y - 1][self.x..self.x + 2] : [0] # awful hack
      self.x += 1
      self.spiral[-1] << (behind + top.inject(:+))
      break if self.spiral.last.length > self.spiral.first.length || spiral.length < 2
    end
  end

  def north
    self.spiral[0...-1].reverse.each do |row|
      behind = self.spiral[self.y][self.x]

      front = self.y > 2 ? self.y - 2 : 0
      side = self.spiral.map {|row| row[self.x - 1]}[front..(self.y)]

      self.y -=  1
      row << (side << behind).inject(:+)
    end

    under = self.spiral[self.y][(self.x - 1)..self.x]
    self.spiral.unshift([under.inject(:+)])
  end

  def west
    loop do
      behind = self.spiral[0][0]

      front = self.spiral[1].length - self.spiral[0].length - 2
      back  = front + 2
      bottom  = front >= 0 ? self.spiral[1][front..back] : self.spiral[1][0..back]

      self.x = (self.x - 1) > 0 ? self.x - 1 : 0
      self.spiral[0].unshift(behind + bottom.inject(:+))

      break if self.spiral.first.length > self.spiral.last.length
    end
  end

  def south
    self.spiral.map {|row| row.unshift(0)}
    self.spiral.first.shift

    self.spiral[1..-1].each do |row|
      behind = self.spiral[self.y][self.x]
      side = self.spiral.map {|row| row[1]}[self.y..(self.y + 2)]

      self.y += 1
      row[0] = ([behind] + side).inject(:+)
    end

    self.y += 1
    self.spiral << [self.spiral.last[0..1].inject(:+)]
  end

  def print
    page = ""
    self.spiral.each do |row|
      row.each do |cell|
        page += "#{cell}\t"
      end
      page += "\n"
    end

    puts page
  end
end


puts Ulam.new(265149).run.solve
