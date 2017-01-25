packages = File.read("../input/day2.txt").chomp.split("\n")
total = 0
packages.each do |dimensions|
  edges = dimensions.split("x").map(&:to_i)
  bow = edges.inject(:*)
  edges.delete_at(edges.find_index(edges.max))
  wrap = edges.inject(:+) * 2
  ribbon = bow + wrap
  total += ribbon
end
p total
