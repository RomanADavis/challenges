# --- Part Two ---
#
# Out of curiosity, the debugger would also like to know the size of the loop:
# starting from a state that has already been seen, how many block
# redistribution cycles must be performed before that same state is seen again?
#
# In the example above, 2 4 1 2 is seen again after four cycles, and so the
# answer in that example would be 4.

require_relative "part1"

class Computer
  def cycles
    defrag
    self.arrangements.length - self.arrangements.find_index(self.memory)
  end
end

pc = Computer.new([0, 2, 7, 0])
p pc.cycles

pc = Computer.new(File.read("../input/banks.txt").split.map(&:to_i))
p pc.cycles
