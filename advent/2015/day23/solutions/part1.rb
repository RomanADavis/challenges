# --- Day 23: Opening the Turing Lock ---
#
# Little Jane Marie just got her very first computer for Christmas from some
# unknown benefactor. It comes with instructions and an example program, but the
# computer itself seems to be malfunctioning. She's curious what the program
# does, and would like you to help her run it.
#
# The manual explains that the computer supports two registers and six
# instructions (truly, it goes on to remind the reader, a state-of-the-art
# technology). The registers are named a and b, can hold any non-negative
# integer, and begin with a value of 0. The instructions are as follows:
#
# hlf r sets register r to half its current value, then continues with the next
# instruction.
# tpl r sets register r to triple its current value, then continues with the
# next instruction.
# inc r increments register r, adding 1 to it, then continues with the next
# instruction.
# jmp offset is a jump; it continues with the instruction offset away relative
# to itself.
# jie r, offset is like jmp, but only jumps if register r is even ("jump if
# even").
# jio r, offset is like jmp, but only jumps if register r is 1 ("jump if one",
# not odd).
# All three jump instructions work with an offset relative to that instruction.
# The offset is always written with a prefix + or - to indicate the direction of
# the jump (forward or backward, respectively). For example, jmp +1 would simply
# continue with the next instruction, while jmp +0 would continuously jump back
# to itself forever.
#
# The program exits when it tries to run an instruction beyond the ones defined.
#
# For example, this program sets a to 2, because the jio instruction causes it
# to skip the tpl instruction:

class Operation
  def initialize(operation)
    self.operation = operation
  end

  def run(*input)
    
  end
end

class Computer
  attr_accessor :registers, :instructions, :instruction_pointer

  def initialize(instructions)
    self.registers = {'a' => 0, 'b' => 0}
    self.instructions = instructions
    self.instruction_pointer = 0
  end

  def run
    while self.instructions[self.instruction_pointer]
      instruction = self.instructions[self.instruction_pointer]
      interpret(instruction)
      self.instruction_pointer += 1 unless instruction[0] == 'j'
    end
  end

  def interpret(instruction)
    instruction = instruction.split
    operation = instruction.shift
    register = instruction.first
    offset = instruction.last

    case operation
    when "half" then half(register)
    when "tpl"  then tpl(register)
    when "inc"  then inc(register)
    when "jmp"  then jmp(offset)
    when "jie"  then jie(register, offset)
    when "jio"  then jio(register, offset)
    end
  end

  def hlf(r)
    self.registers[r] /= 2
  end

  def tpl(r)
    self.registers[r] *= 3
  end

  def inc(register)
    self.registers[r] += 1
  end

  def jmp(offset)
    self.instruction_pointer += offset.to_i
  end

  def jie(r, offset)
    jmp(offset) if self.registers[r].even?
  end

  def jio(r, offset)
    jmp(offset) if self.registers[r] == 1
  end
end
