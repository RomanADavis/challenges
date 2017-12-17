class Collatz
  attr_accessor :position, :iterations
  def initialize(start)
    self.position   = start
    self.iterations = 0
  end

  def next_value
    self.position.even? ? self.position / 2 : self.position * 3 + 1
  end

  def chain_length
    until self.position == 1
      self.position    = next_value
      self.iterations += 1
    end

    self.iterations
  end

  def self.longest_chain_under(n) # Takes several seconds
    (1..n).max_by {|start| self.new(start).chain_length}
  end
end

p Collatz.longest_chain_under(1_000_000)
