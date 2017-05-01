#+#+#+#+#+#+#+#+#+#+#+#+#+ --- Part Two ---
#
# While playing with all the containers in the kitchen, another load of eggnog
# arrives! The shipping and receiving department is requesting as many
# containers as you can spare.
#
# Find the minimum number of containers that can exactly fit all 150 liters of
# eggnog. How many different ways can you fill that number of containers and
# still hold exactly 150 litres?
#
# In the example above, the minimum number of containers was two. There were
# three ways to use that many containers, and so the answer there would be 3.
#
# Although it hasn't changed, you can still get your puzzle input.

require_relative "part1"

input = File.readlines("./input/containers.txt").map(&:to_i)

ways = ways_to_fill_a_fridge(150, input)

smallest = ways.min_by {|way| way.length}.length

puts ways.select {|way| way.length == smallest }.length
