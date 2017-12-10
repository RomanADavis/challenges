# --- Part Two ---
#
# To be safe, the CPU also needs to know the highest value held in any register
# during this process so that it can decide how much memory to allocate to these
# operations

require_relative "part1.rb"

class Computer
  attr_accessor :max
  def solve
    self.max = 0
    self.lines.each do |line|
      parse(line)
      highest = self.registers.values.max
      self.max = highest if highest > self.max
    end

    self.max
  end
end

p Computer.new("../input/instructions.txt").solve
