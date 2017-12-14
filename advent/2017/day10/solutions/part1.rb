# --- Day 10: Knot Hash ---
#
# You come across some programs that are trying to implement a software
# emulation of a hash based on knot-tying. The hash these programs are
# implementing isn't very strong, but you decide to help them anyway. You make a
# mental note to remind the Elves later not to invent their own cryptographic
# functions.
#
# This hash function simulates tying a knot in a circle of string with 256 marks
# on it. Based on the input to be hashed, the function repeatedly selects a
# span of string, brings the ends together, and gives the span a half-twist to
# reverse the order of the marks within it. After doing this many times, the
# order of the marks is used to build the resulting hash.
#
#   4--5   pinch   4  5           4   1
#  /    \  5,0,1  / \/ \  twist  / \ / \
# 3      0  -->  3      0  -->  3   X   0
#  \    /         \ /\ /         \ / \ /
#   2--1           2  1           2   5
#
# To achieve this, begin with a list of numbers from 0 to 255, a current
# position which begins at 0 (the first element in the list), a skip size
# (which starts at 0), and a sequence of lengths (your puzzle input). Then,
# for each length:
#
# Reverse the order of that length of elements in the list, starting with the
# element at the current position.
#
# Move the current position forward by that length plus the skip size.
# Increase the skip size by one.
#
# The list is circular; if the current position and the length try to reverse
# elements beyond the end of the list, the operation reverses using as many
# extra elements as it needs from the front of the list. If the current position
# moves past the end of the list, it wraps around to the front. Lengths larger
# than the size of the list are invalid.

class KnotHash
  attr_accessor :content, :position, :lengths, :skip_size

  def initialize(lengths, tail = 255)
    self.lengths = lengths
    self.content = (0..tail).to_a
    self.position = 0
    self.skip_size = 0
  end

  def solve
    # p self.content
    self.lengths.each do |length|
      twist(length)
      self.position = (self.position + length + self.skip_size) % self.content.length
      self.skip_size += 1
    end

    self.content[0..1].inject(:*)
  end

  def twist(length)
    tail = self.position + length
    mirror = self.content[position..(tail - 1)] || []

    if mirror.length < length
      mirror += self.content[0..(length - mirror.length - 1)]
    end

    mirror = mirror.reverse

    self.content.each_with_index do |_, index|
      self.content[index] = mirror.shift if index >= position && mirror[-1]
    end

    mirror.each_with_index do |value, index|
      self.content[index] = value
    end

    self.content
  end
end

p KnotHash.new([3, 4, 1, 5], 4).solve

lengths = File.readlines("../input/lengths.txt")[0].split(',').map(&:to_i)

p KnotHash.new(lengths).solve
