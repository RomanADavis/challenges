#+#+#+#+#+#+#+# --- Day 17: No Such Thing as Too Much ---
#
# The elves bought too much eggnog again - 150 liters this time. To fit it all
# into your refrigerator, you'll need to move it into smaller containers. You
# take an inventory of the capacities of the available containers.
#
# For example, suppose you have containers of size 20, 15, 10, 5, and 5 liters.
# If you need to store 25 liters, there are four ways to do it:
#
#     15 and 10
#     20 and 5 (the first 5)
#     20 and 5 (the second 5)
#     15, 5, and 5
#
# Filling all containers entirely, how many different combinations of containers
# can exactly fit all 150 liters of eggnog?

# Recursive method

def ways_to_fill_a_fridge(amount, available = [5, 5, 10, 15, 20])
  containers = 1
  ways = []
  until containers > available.length
    schemes = available.combination(containers)
    schemes.each {|scheme| ways << scheme if scheme.inject(:+) == amount}
    containers += 1
  end
  ways.length
end

p ways_to_fill_a_fridge(25)

input = File.readlines("./input/containers.txt").map(&:to_i)

p ways_to_fill_a_fridge(150, input)
