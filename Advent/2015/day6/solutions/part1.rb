# --- Day 6: Probably a Fire Hazard ---
#
# Because your neighbors keep defeating you in the holiday house decorating
# contest year after year, you've decided to deploy one million lights in a
# 1000x1000 grid.
#
# Furthermore, because you've been especially nice this year, Santa has mailed
# you instructions on how to display the ideal lighting configuration.
#
# Lights in your grid are numbered from 0 to 999 in each direction; the lights
# at each corner are at 0,0, 0,999, 999,999, and 999,0. The instructions include
# whether to turn on, turn off, or toggle various inclusive ranges given as
# coordinate pairs. Each coordinate pair represents opposite corners of a
# rectangle, inclusive; a coordinate pair like 0,0 through 2,2 therefore refers
# to 9 lights in a 3x3 square. The lights all start turned off.
#
# To defeat your neighbors this year, all you have to do is set up your lights
#   by doing the instructions Santa sent you in order.

class Grid
  def initialize
    @lights = Array.new(1000) { Array.new(1000) {false} }
  end

  def turn_on(x, y, x2, y2)
    (y..y2).each {|y| (x..x2).each {|x| @lights[y][x] = true} }
  end

  def toggle(x, y, x2, y2)
    (y..y2).each {|y| (x..x2).each {|x| @lights[y][x] = @lights[y][x] ? false : true} }
  end

  def turn_off(x, y, x2, y2)
    (y..y2).each {|y| (x..x2).each {|x| @lights[y][x] = false} }
  end

  def count
    @lights.inject(0) {|total, line| total + line.count {|light| light} }
  end

  def parse(instruction)
    instruction = instruction.split(" ")
    x, y = instruction[-3].split(",").map(&:to_i)
    x2, y2 = instruction[-1].split(",").map(&:to_i)
    case instruction[1]
    when "on" then turn_on(x, y, x2, y2)
    when "off" then turn_off(x, y, x2, y2)
    else toggle(x, y, x2, y2)
    end
  end
end

grid = Grid.new

File.readlines("./input/instructions.txt")
  .each {|instruction| grid.parse(instruction.chomp) }

p grid.count
