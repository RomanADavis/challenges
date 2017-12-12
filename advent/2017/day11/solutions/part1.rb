# --- Day 11: Hex Ed ---
#
# Crossing the bridge, you've barely reached the other side of the stream when a
# program comes up to you, clearly in distress. "It's my child process," she
# says, "he's gotten lost in an infinite grid!"
#
# Fortunately for her, you have plenty of experience with infinite grids.
#
# Unfortunately for you, it's a hex grid.
#
# The hexagons ("hexes") in this grid are aligned such that adjacent hexes can
# be found to the north, northeast, southeast, south, southwest, and northwest:
#
#   \ n  /
# nw +--+ ne
#   /    \
# -+      +-
#   \    /
# sw +--+ se
#   / s  \
#
# You have the path the child process took. Starting where he started, you need
# to determine the fewest number of steps required to reach him. (A "step" means
# to move from the hex you are in to any adjacent hex.)



def solve(directions)
  directions = parse(directions)
  steps = map(directions)

  count(steps)
end

def count(steps)
  latitude = (steps['n'] - steps['s']).abs
  longitude = (steps['e'] - steps['w']).abs

  (latitude + longitude) / 2
end

def map(directions)
  cardinals = Hash.new(0)

  directions = ['n', 'e', 's', 'w'].map do |cardinal|
    cardinals[cardinal] = directions.count {|direction| direction == cardinal}
  end

  cardinals
end

def parse(directions)
  directions = directions.split(',').map do |direction|
    direction == 's' || direction == 'n' ? direction * 2 : direction
  end

  directions.join.chars
end

p solve("ne,ne,ne")
p solve(File.read("../input/directions.txt"))
