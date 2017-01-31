# --- Part Two ---
#
# You flip the instructions over; Santa goes on to point out that this is all
# just an implementation of Conway's Game of Life. At least, it was, until you
# notice that something's wrong with the grid of lights you bought: four lights,
# one in each corner, are stuck on and can't be turned off.

class Grid
  attr_accessor :lights, :size

  def initialize(state)
    self.size = state.length
    self.lights = Array.new(size) { Array.new(size)}

    self.lights.each_with_index do |row, y|
      row.map!.with_index do |_, x|
        next true if [x, y] == [0, 0] || [x, y] == [self.size - 1, self.size - 1]
        next true if [x, y] == [0, self.size - 1] || [x, y] == [self.size - 1, 0]
        state[y][x] == '#' ? true : false
      end
    end
  end

  def display
    graph = self.lights.map {|y| y.map {|x| x ? '#' : '.'}.join }.join("\n")
    "~" * 10 + "\n" + graph + "\n" + "~" * 10
  end

  def neighbors(x, y)
    cells = []
    cells << self.lights[y - 1][x - 1] unless x == 0 || y == 0
    cells << self.lights[y - 1][x] unless y == 0
    cells << self.lights[y - 1][x + 1] unless x == size - 1 || y == 0
    cells << self.lights[y][x - 1] unless x == 0
    cells << self.lights[y][x + 1] unless x == size - 1
    cells << self.lights[y + 1][x - 1] unless x == 0 || y == size - 1
    cells << self.lights[y + 1][x] unless y == size - 1
    cells << self.lights[y + 1][x + 1] unless x == size - 1 || y == size - 1
    cells
  end

  def light_tick(x, y)
    count = neighbors(x, y).count {|neighbor| neighbor}

    return true if [x, y] == [0, 0] || [x, y] == [self.size - 1, self.size - 1]
    return true if [x, y] == [0, self.size - 1] || [x, y] == [self.size - 1, 0]

    return true if self.lights[y][x] && count == 2
    return true if count == 3
    false
  end

  def tick
    future = Array.new(self.size) {Array.new(self.size) {false}}
    future.map!.with_index do |row, y|
      row.map!.with_index {|_, x| light_tick(x, y)}
    end
    self.lights = future
    self
  end
end

input = File.readlines("./input/lights.txt")
grid = Grid.new(input)
100.times {grid.tick}
puts grid.lights.map {|row| row.count {|count| count}}.inject(:+)
