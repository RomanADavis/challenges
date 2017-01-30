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

def methods_of_change(amount, containers = [25, 15, 10, 5])
  return 0 if amount.zero?
  ways = 0
  containers.each do |container|
    next if (amount - container) < 0
    next ways += 1 if amount == container
    ways += 1 + methods_of_change(amount - container)
  end
  ways
end

p methods_of_change(25)
p methods_of_change(150)
