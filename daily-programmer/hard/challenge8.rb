#=#=#=#=#=#=#=#= Challenge 8 =#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=
# Write a program that will take coordinates, and tell you the corresponding
# number in pascals triangle. For example:
# Input: 1, 1
# output:1
# input: 4, 2
# output: 3 < Pretty sure this is wrong. It shound be 4.
# input: 1, 19
# output: error/nonexistent/whatever
# the format should be "line number, integer number"
# for extra credit, add a function to simply print the triangle, for the extra
# credit to count, it must print at least 15 lines.
#===========================================================================

# Recursive solution is the most fun. :)
def value(x, y)
  return 1 if x == 1 || y == 1
  value(x - 1, y) + value(x, y - 1)
end

#=#=#=#=# GHETTO TESTS
#puts value(1, 1)
#puts value(4, 2)
#puts value(1, 19)

def lower_layer(upper_layer)
  lower = upper_layer.split(" ").map(&:to_i).each_cons(2).map do |first, second|
    first + second
  end
  ([1] + lower + [1]).map(&:to_s).join(" ")
end

#puts lower_layer "1"
#puts lower_layer "1 2 1"

def pyramid(layers)
  upper_layer = "1"
  tower = ["1"]
  layers.times do
    tower << upper_layer = lower_layer(upper_layer)
  end
  tower
end

puts pyramid(23)
