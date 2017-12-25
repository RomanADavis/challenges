

class UlamSpiral
  attr_accessor :value, :spiral
  def initialize(n)
    self.value = 1
    self.spiral = [[1]]

    until self.spiral.length >= n
      south
      west
      north
      east
    end
  end

  def east
    self.spiral.unshift([self.value += 1])

    until self.spiral[0].length == self.spiral.length
      self.spiral[0] << self.value += 1
    end
  end

  def south
    self.spiral.each do |row|
      row << self.value += 1
    end
  end

  def west
    self.spiral << [self.value += 1]

    until self.spiral[-1].length == self.spiral.length
      self.spiral[-1].unshift(self.value += 1)
    end
  end

  def north
    self.spiral.reverse_each do |row|
      row.unshift(self.value += 1)
    end
  end

  def print_grid
    self.spiral.each do |row|
      row.each do |cell|
        print "#{cell}\t"
      end
      print "\n"
    end
  end

  def solve
    left_diagonals  = (0...self.spiral.length).map {|x| self.spiral[x][x]}
    right_diagonals = (1.. self.spiral.length).map {|x| self.spiral[x - 1][-x]}

    (left_diagonals + right_diagonals).uniq.inject(:+)
  end
end

p UlamSpiral.new(5).solve

p UlamSpiral.new(1001).solve
