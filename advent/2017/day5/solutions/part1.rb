# An urgent interrupt arrives from the CPU: it's trapped in a maze of jump
# instructions, and it would like assistance from any programs with spare cycles
# to help find the exit.
#
# The message includes a list of the offsets for each jump. Jumps are relative:
# -1 moves to the previous instruction, and 2 skips the next one. Start at the
# first instruction in the list. The goal is to follow the jumps until one leads
# outside the list.
#
# In addition, these instructions are a little strange; after each jump, the
# offset of that instruction increases by 1. So, if you come across an offset of
# 3, you would move three instructions forward, but change it to a 4 for the
# next time it is encountered.

class Computer
  def initialize(program)
    self.jumps = program.map(&:to_i)
    self.pointers = {'@' => 0, '@+' => 0} #Instruction pointer + lookahead
    self.counter = 0
  end

  def run
    while self.jumps[self.pointers['@']]
      step
      self.counter += 1
    end
  end

  def step
    self.pointers['@+'] = self.jumps[self.pointers['@']] + self.pointers['@']
    self.jumps[self.pointers['@']] += 1
    self.pointers['@'] = self.pointers['@+']
  end
end
