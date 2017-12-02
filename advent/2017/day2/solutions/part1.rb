# --- Day 2: Corruption Checksum ---
#
# As you walk through the door, a glowing humanoid shape yells in your
# direction. "You there! Your state appears to be idle. Come help us repair the
# corruption in this spreadsheet - if we take another millisecond, we'll have to
# display an hourglass cursor!"
#
# The spreadsheet consists of rows of apparently-random numbers. To make sure
# the recovery process is on the right track, they need you to calculate the
# spreadsheet's checksum. For each row, determine the difference between the
# largest value and the smallest value; the checksum is the sum of all of these
# differences.

def check(sheet)
  cells = sheet.map {|row| row.split.map {|cell| cell.to_i} }
  p cells
  cells.inject(0) {|total, row| total + (row.max - row.min)}
end


p check(File.readlines("./input/part1.txt"))
p File.read("./input/part1.txt")
