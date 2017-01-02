require_relative "./day3part1"

directions = File.read("../input/day3.txt").chomp.chars

robo_position = santa_position = [0, 0]
houses = [[0, 0]]
directions.each_with_index do |direction, index|
  if index % 2 == 0
    houses << santa_position = move(santa_position.dup, direction)
  else
    houses << robo_position = move(robo_position.dup, direction)
  end
end
p houses.uniq.length
