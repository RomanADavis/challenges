numpad = [["1", "2", "3"],
          ["4", "5", "6"],
          ["7", "8", "9"]]

location = [1, 1]

def limit(location)
  location[0] = 0 if location.first < 0
  location[1] = 0 if location.last < 0
  location[0] = 2 if location.first > 2
  location[1] = 2 if location.last > 2
  location
end

def move(location, direction)
  case direction
  when "U" then location[0] += 1
  when "R" then location[1] += 1
  when "D" then location[0] -= 1
  when "L" then location[1] -= 1
  end
  limit(location)
end

instructions = File.read("./input/day2.txt").chomp.split("\n")
digits = ""
instructions.each do |instruction|
  instruction.chars.each { |direction| location = move(location, direction) }
  digits += numpad[location.first][location.last]
end

p digits
p instructions
