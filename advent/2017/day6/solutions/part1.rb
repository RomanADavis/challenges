# --- Day 6: Memory Reallocation ---
#
# A debugger program here is having an issue: it is trying to repair a memory
# reallocation routine, but it keeps getting stuck in an infinite loop.
#
# In this area, there are sixteen memory banks; each memory bank can hold any
# number of blocks. The goal of the reallocation routine is to balance the
# blocks between the memory banks.
#
# The reallocation routine operates in cycles. In each cycle, it finds the
# memory bank with the most blocks (ties won by the lowest-numbered memory bank)
# and redistributes those blocks among the banks. To do this, it removes all of
# the blocks from the selected bank, then moves to the next (by index) memory
# bank and inserts one of the blocks. It continues doing this until it runs
# out of blocks; if it reaches the last memory bank, it wraps around to the
# first one.
#
# The debugger would like to know how many redistributions can be done before a
# blocks-in-banks configuration is produced that has been seen before.

class Computer
  attr_accessor :memory, :arrangements
  def initialize(memory_banks)
    self.memory = memory_banks
    self.arrangements = []
  end

  def reallocate
    start = self.memory.find_index(self.memory.max)
    steps = self.memory.max
    self.memory[start] = 0

    (1..steps).each do |step|
      self.memory[(start + step) % self.memory.length] += 1
    end
  end

  def defrag
    loop do
      self.arrangements << self.memory.dup
      reallocate
      break if self.arrangements.include? self.memory
    end

    self
  end
end

pc = Computer.new([0, 2, 7, 0])
p pc.defrag.arrangements.length

pc = Computer.new(File.read("../input/banks.txt").split.map(&:to_i))
p pc.defrag.arrangements.length
