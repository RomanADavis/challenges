# --- Part Two ---
#
# You just finish implementing your winning light pattern when you realize you
# mistranslated Santa's message from Ancient Nordic Elvish.
#
# The light grid you bought actually has individual brightness controls; each
# light can have a brightness of zero or more. The lights all start at zero.
#
# The phrase turn on actually means that you should increase the brightness of
# those lights by 1.
#
# The phrase turn off actually means that you should decrease the brightness of
# those lights by 1, to a minimum of zero.
#
# The phrase toggle actually means that you should increase the brightness of
# those lights by 2.
#
# What is the total brightness of all lights combined after following Santa's
# instructions?

class Grid
  def initialize
    @lights = Array.new(1000) { Array.new(1000) {0} }
  end

  def turn_on(x, y, x2, y2)
    (y..y2).each {|y| (x..x2).each {|x| @lights[y][x] += 1} }
  end

  def toggle(x, y, x2, y2)
    (y..y2).each {|y| (x..x2).each {|x| @lights[y][x] += 2} }
  end

  def turn_off(x, y, x2, y2)
    (y..y2).each {|y| (x..x2).each {|x| @lights[y][x] -= 1 unless @lights[y][x] == 0} }
  end

  def count
    @lights.inject(0) {|total, line| total + line.inject(:+) }
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
