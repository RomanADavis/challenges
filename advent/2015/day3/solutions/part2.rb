# --- Part Two ---
#
# The next year, to speed up the process, Santa creates a robot version of
# himself, Robo-Santa, to deliver presents with him.
#
# Santa and Robo-Santa start at the same location (delivering two presents to
# the same starting house), then take turns moving based on instructions from
# the elf, who is eggnoggedly reading from the same script as the previous year.
#
# This year, how many houses receive at least one present?

require_relative "part1"

def lets_split_up (directions)#How am I supposed to name this?
  directions = directions.chars

  santa_directions = directions.select.with_index {|_, index| index % 2 == 0}
  robo_directions = directions.select.with_index {|_, index| index % 2 == 1}

  santa_houses = Map.new.travel(santa_directions.join).houses
  robo_houses = Map.new.travel(robo_directions.join).houses

  (santa_houses + robo_houses).uniq.length
end

directions = File.read("./input/directions.txt")

puts lets_split_up(directions)
