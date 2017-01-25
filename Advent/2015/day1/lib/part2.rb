# --- Part Two ---
#
# Now, given the same instructions, find the position of the first character
# that causes him to enter the basement (floor -1). The first character in the
# instructions has position 1, the second character has position 2, and so on.

stairs = File.read("./input/day1.txt").chomp

# Slightly over golfed. Learned something interesting.
def basement stairs
  floor = stairs.chars.each.with_index.inject(0) do |floor, (stair, index)|
    return index if floor == -1
    floor + (stair == "(" ? 1 : -1)
  end
  floor == -1 ? 0 : -1 #Hack for if santa enters the basement on first stairs.
end

puts basement stairs
