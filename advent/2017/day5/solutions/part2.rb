# Now, the jumps are even stranger: after each jump, if the offset was three or
# more, instead decrease it by 1. Otherwise, increase it by 1 as before.
#
# Using this rule with the above example, the process now takes 10 steps, and
# the offset values after finding the exit are left as 2 3 2 3 -1.
#
# How many steps does it now take to reach the exit?

class Computer
  attr_accessor :jumps, :pointers, :counter
  def initialize(program)
    self.jumps = program.map(&:to_i)
    self.pointers = {'@' => 0, '@+' => 0} #Instruction pointer + lookahead
    self.counter = 0
  end

  def count
    run
    self.counter
  end

  def run
    while self.jumps[self.pointers['@']]
      step
      self.counter += 1
    end
  end

  def step
    self.pointers['@+'] = self.jumps[self.pointers['@']] + self.pointers['@']

    if self.jumps[self.pointers['@']] > 2
      self.jumps[self.pointers['@']] -= 1
    else
      self.jumps[self.pointers['@']] += 1
    end

    self.pointers['@'] = self.pointers['@+']
  end
end

p Computer.new([0, 3, 0, 1, -3]).count

p Computer.new(File.readlines("../input/jumps.txt")).count
