class SpinLock
  attr_accessor :steps, :buffer, :position
  def initialize(steps)
    self.steps = steps
    self.buffer = [0]
    self.position = 0
  end

  def step(value)
    self.position = (self.position + self.steps) % self.buffer.length
    self.buffer.insert(self.position, value)
    p value if self.position == 1
  end

  def run(cycles)
    cycles.times {|value| step(value + 1)}

    self.buffer[self.buffer.find_index(cycles) + 1]
  end

  def solve(cycles)
    result = 1
    (1..(cycles + 1)).each do |length|
      self.position = (self.position + self.steps) % length
      p result = length if self.position == 0
      self.position += 1
    end
    result
  end
end

s = SpinLock.new(3)
p s.run(2017)
s = SpinLock.new(355)
p s.run(2017)

s = SpinLock.new(355)
p s.solve(50_000_000)
