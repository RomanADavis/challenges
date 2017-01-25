# --- Day 3: Perfectly Spherical Houses in a Vacuum ---
#
# Santa is delivering presents to an infinite two-dimensional grid of houses.
#
# He begins by delivering a present to the house at his starting location, and
# then an elf at the North Pole calls him via radio and tells him where to move
# next. Moves are always exactly one house to the north (^), south (v), east
# (>), or west (<). After each move, he delivers another present to the house at
# his new location.
#
# However, the elf back at the north pole has had a little too much eggnog, and
# so his directions are a little off, and Santa ends up visiting some houses
# more than once. How many houses receive at least one present?

class Map
  attr_accessor :presents, :x, :y
  def initialize
    self.x = self.y = 0
    self.presents = [[self.x, self.y]]
  end

  def go(direction)
    case direction
    when '^' then self.y -= 1
    when '>' then self.x += 1
    when 'v' then self.y += 1
    when '<' then self.x -= 1
    end

    self.presents << [self.x, self.y]
    self
  end

  def travel(directions)
    directions.each_char {|direction| go(direction)}
    self
  end

  def houses
    self.presents.uniq
  end
end

directions = File.read("./input/directions.txt")

puts Map.new.travel(directions).houses.length
