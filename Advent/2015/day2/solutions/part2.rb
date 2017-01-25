# --- Part Two ---
#
# The elves are also running low on ribbon. Ribbon is all the same width, so
# they only have to worry about the length they need to order, which they would
# again like to be exact.
#
# The ribbon required to wrap a present is the shortest distance around its
# sides, or the smallest perimeter of any one face. Each present also requires a
# bow made out of ribbon as well; the feet of ribbon required for the perfect
# bow is equal to the cubic feet of volume of the present. Don't ask how they
# tie the bow, though; they'll never tell.

def ribbon(dimensions)
  dimensions = dimensions.split("x").map(&:to_i)

  bow = dimensions.inject(:*)
  ribbon = dimensions.combination(2).map {|edges| edges.inject(:+)}.min * 2

  ribbon + bow
end

packages = File.read("./input/packages.txt").chomp.split("\n")

puts packages.inject(0) {|total, package| total + ribbon(package)}
