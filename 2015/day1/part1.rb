directions = File.read("../input/day1.txt").chomp.chars
p directions.map { |direction| direction == "(" ? 1 : -1 }.inject(:+)
