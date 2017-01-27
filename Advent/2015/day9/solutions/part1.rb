# --- Day 9: All in a Single Night ---
#
# Every year, Santa manages to deliver all of his presents in a single night.
#
# This year, however, he has some new locations to visit; his elves have
# provided him the distances between every pair of locations. He can start and
# exactly once. What is the shortest distance he can travel to achieve this?

routes = File.readlines("./input/routes.txt")

distances = {}

routes.each do |route|
  places, distance = route.chomp.split(" = ")
  a, b = places.split.first, places.split.last
  [a, b].each {|place| distances[place] = {} unless distances[place]}
  distances[a][b] = distance.to_i
  distances[b][a] = distance.to_i
end

places = distances.keys
trips = []

places.permutation.to_a.each do |trip|
   trips << trip.each_cons(2).map  {|a, b| distances[a][b]}.inject(:+)
end

puts trips.min # This is all I had to change.
