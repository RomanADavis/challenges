# --- Day 12: Digital Plumber ---
#
# Walking along the memory banks of the stream, you find a small village that is
# experiencing a little confusion: some programs can't communicate with each
# other.
#
# Programs in this village communicate using a fixed system of pipes. Messages
# are passed between programs using these pipes, but most programs aren't
# connected to each other directly. Instead, programs pass messages between each
# other until the message reaches the intended recipient.
#
# For some reason, though, some of these messages aren't ever reaching their
# intended recipient, and the programs suspect that some pipes are missing. They
# would like you to investigate.
#
# You walk through the village and record the ID of each program and the IDs
# with which it can communicate directly (your puzzle input). Each program has
# one or more programs with which it can communicate, and these pipes are
# bidirectional; if 8 says it can communicate with 11, then 11 will say it can
# communicate with 8.
#
# You need to figure out how many programs are in the group that contains
# program ID 0.
require "set"

class Pipes
  attr_accessor :connections
  def initialize(file)
    self.connections = File.readlines(file).map do |line|
      line.split[2..-1].join.split(",").map(&:to_i)
    end
  end

  def solve(n)
    connected = Set.new([n])
    looked_at = Set.new([n])

    loop do
      connected.each do |con|
        connected += self.connections[con]
        looked_at << con
      end

      break if looked_at == connected
    end

    connected
  end
end

p Pipes.new("../input/programs.txt").solve(0).length
