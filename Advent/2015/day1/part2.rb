dirctions = File.read("../input/day1.txt").chomp.chars
floor = 0
dirctions.each_with_index do |direction, index|
  floor += direction == "(" ? 1 : -1
  break p index + 1 if floor == -1
end
