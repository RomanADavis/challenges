# --- Day 7: Recursive Circus ---
#
# Wandering further through the circuits of the computer, you come upon a tower
# of programs that have gotten themselves into a bit of trouble. A recursive
# algorithm has gotten out of hand, and now they're balanced precariously in a
# large tower.
#
# One program at the bottom supports the entire tower. It's holding a large
# disc, and on the disc are balanced several more sub-towers. At the bottom of
# these sub-towers, standing on the bottom disc, are other programs, each
# holding their own disc, and so on. At the very tops of these sub-sub-sub-...
# -towers, many programs stand simply keeping the disc below them balanced but
# with no disc of their own.
#
# You offer to help, but first you need to understand the structure of these
# towers. You ask each program to yell out their name, their weight, and (if
# they're holding a disc) the names of the programs immediately above them
# balancing on that disc. You write this information down (your puzzle input).
# Unfortunately, in their panic, they don't do this in an orderly fashion; by
# the time you're done, you're not sure which program gave which information.

class Computer
  attr_accessor :programs
  def initialize(filename)
    self.programs = File.readlines(filename)
  end

  def solve
    masters = self.programs.map {|program| program.split[0]}

    slaves = self.programs.map do |program|
      slaves = program.split(" -> ")[1]
      slaves ? slaves.split(", ").map(&:chomp) : []
    end

    slaves = slaves.flatten.uniq

    masters.reject {|master| slaves.include? master}
  end
end

p Computer.new("../input/sample.txt").solve
p Computer.new("../input/programs.txt").solve
