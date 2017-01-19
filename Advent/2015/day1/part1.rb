directions = File.open("day1.txt").chomp.chars
puts directions.map { |direction| direction == "(" ? 1 : -1 }.inject(:+)
