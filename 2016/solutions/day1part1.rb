input = File.read("./input/day1.txt").chomp.split(", ")
cardinal = :north
totals = {north: 0, east: 0, south: 0, west: 0}

def turn(cardinal, direction)
  case cardinal
  when :north
    return direction == "L" ? :west : :east
  when :east
    return direction == "L" ? :north : :south
  when :west
    return direction == "L" ? :south : :north
  else
    return direction   == "L" ? :east : :west
  end
end

input.each do |i|
  cardinal = turn(cardinal, i[0])
  totals[cardinal] += i[1..-1].to_i
end

total = (totals[:north] - totals[:south]).abs + (totals[:east] - totals[:west]).abs
p total
