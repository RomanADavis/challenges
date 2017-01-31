# --- Day 18: Like a GIF For Your Yard ---
#
# After the million lights incident, the fire code has gotten stricter: now, at
# most ten thousand lights are allowed. You arrange them in a 100x100 grid.
#
# Never one to let you down, Santa again mails you instructions on the ideal
# lighting configuration. With so few lights, he says, you'll have to resort to
# animation.
#
# Start by setting your lights to the included initial configuration (your
# puzzle input). A # means "on", and a . means "off".
#
# Then, animate your grid in steps, where each step decides the next
# configuration based on the current one. Each light's next state (either on or
# off) depends on its current state and the current states of the eight lights
# adjacent to it (including diagonals). Lights on the edge of the grid might
# have fewer than eight neighbors; the missing ones always count as "off".
#
# For example, in a simplified 6x6 grid, the light marked A has the neighbors
# numbered 1 through 8, and the light marked B, which is on an edge, only has
# the neighbors marked 1 through 5:
#
# 1B5...
# 234...
# ......
# ..123.
# ..8A4.
# ..765.
#
# The state a light should have next is based on its current state (on or off)
# plus the number of neighbors that are on:
#
#     A light which is on stays on when 2 or 3 neighbors are on, and turns off
#     otherwise.
#     A light which is off turns on if exactly 3 neighbors are on, and stays off
#     otherwise.
#
# All of the lights update simultaneously; they all consider the same current
# state before moving to the next.
#
# In your grid of 100x100 lights, given your initial configuration, how many lights are on after 100 steps?

class Grid
  attr_accessor :lights, :size

  def initialize(state)
    self.size = state.length
    self.lights = Array.new(size) { Array.new(size)}

    self.lights.each_with_index do |row, y|
      row.map!.with_index {|_, x| state[y][x] == '#' ? true : false}
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
