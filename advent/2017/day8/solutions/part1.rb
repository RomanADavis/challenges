# --- Day 8: I Heard You Like Registers ---
#
# You receive a signal directly from the CPU. Because of your recent assistance
# with jump instructions, it would like you to compute the result of a series of
# unusual register instructions.
#
# Each instruction consists of several parts: the register to modify, whether to
# increase or decrease that register's value, the amount by which to increase or
# decrease it, and a condition. If the condition fails, skip the instruction
# without modifying the register.

class Computer
  attr_accessor :registers, :lines
  def initialize(filename)
    self.registers = Hash.new(0)
    self.lines = File.readlines(filename)
  end

  def solve
    run
    self.registers.values.max
  end

  def run
    self.lines.each do |line|
      parse(line)
    end

    self
  end

  def parse(instruction)
    words = instruction.split
    execute(words[0..2]) if evaluate(words[-3..-1])
  end

  def execute(instruction)
    register =  instruction.shift
    operation = instruction.shift
    value =     instruction.shift.to_i

    case operation
    when "inc" then self.registers[register] += value
    when "dec" then self.registers[register] -= value
    end
  end

  def evaluate(expression)
    register =  expression.shift
    operation = expression.shift
    value =     expression.shift

    eval("self.registers[register] #{operation} #{value}")
  end
end

p Computer.new("../input/sample.txt"      ).solve
p Computer.new("../input/instructions.txt").solve
