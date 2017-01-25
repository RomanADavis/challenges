def wrapping(dimensions)
  dimensions = dimensions.split("x").map(&:to_i)

  sides = dimensions.combination(2).map {|edges| edges.inject(:*)}
  wrapping = sides.inject(:+) * 2
  bow = sides.min

  wrapping + bow
end

presents = File.read("./input/packages.txt").chomp.split("\n")

puts presents.inject(0) {|total, package| total + wrapping(package)}
