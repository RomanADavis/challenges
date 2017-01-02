packages = File.read("../input/day2.txt").chomp.split("\n")
total = 0
packages.each do |dimensions|
  edges = dimensions.split("x").map(&:to_i)
  sides = edges.combination(2).map {|edges| edges.inject(:*)}
  wrapping = sides.inject(:+) * 2 + sides.min
  total += wrapping
end
p total
