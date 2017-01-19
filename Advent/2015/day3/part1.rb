directions = File.read("../input/day3.txt").chomp.chars

def move(position, direction)
  case direction
  when "^" then position[1] -= 1
  when ">" then position[0] += 1
  when "v" then position[1] += 1
  when "<" then position[0] -= 1
  end
  position
end

house = [0, 0]
houses = [house]

directions.each do |direction|
  house = move(house.dup, direction)
  houses << house
end

p houses.uniq.length
