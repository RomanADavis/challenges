# --- Part Two ---
#
# The next year, just to show off, Santa decides to take the route with the
# longest distance instead.
#
# He can still start and end at any two (different) locations he wants, and he
# still must visit each location exactly once.
#
# For example, given the distances above, the longest route would be 982 via
# (for example) Dublin -> London -> Belfast.
#

routes = File.readlines("./input/routes.txt")
distances = {}

routes.each do |route|
  places, distance = route.chomp.split(" = ")
  a, b = places.split.first, places.split.last
  [a, b].each {|place| distances[place] = {} unless distances[place]}
  distances[a][b] = distance.to_i
  distances[b][a] = distance.to_i
end

puts distances

places = distances.keys
trips = []

places.permutation.to_a.each do |trip|
   trips << trip.each_cons(2).map  {|a, b| distances[a][b]}.inject(:+)
end
puts trips.max # This is all I had to change.
