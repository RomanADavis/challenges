# --- Day 2: I Was Told There Would Be No Math ---
#
# The elves are running low on wrapping paper, and so they need to submit an
# order for more. They have a list of the dimensions (length l, width w, and
# height h) of each present, and only want to order exactly as much as they
# need.
#
# Fortunately, every present is a box (a perfect right rectangular prism),
# which makes calculating the required wrapping paper for each gift a little
# easier: find the surface area of the box, which is 2*l*w + 2*w*h + 2*h*l. The
# elves also need a little extra paper for each present: the area of the
# smallest side.

def wrapping(dimensions)
  dimensions = dimensions.split("x").map(&:to_i)

  sides = dimensions.combination(2).map {|edges| edges.inject(:*)}
  wrapping = sides.inject(:+) * 2
  bow = sides.min

  wrapping + bow
end

presents = File.read("./input/packages.txt").chomp.split("\n")

puts presents.inject(0) {|total, package| total + wrapping(package)}
