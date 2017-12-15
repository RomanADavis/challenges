class Generator
  attr_accessor :seed, :factor
  def initialize(seed, factor)
    self.seed   = seed
    self.factor = factor
  end

  def next
    self.seed = self.seed * self.factor % 2147483647
  end
end

class Judge
  attr_accessor :generators, :matches
  def initialize(*generators)
    self.generators = generators
    self.matches    = 0
  end

  def match? # Check if the last sixteen bits of the next seed match for all generators
    generators.map {|generator| generator.next & 0xFFFF}.uniq.length == 1
  end

  def round
    self.matches += 1 if match?
  end

  def tally(rounds)
    rounds.times {round}

    self.matches
  end
end

# p Judge.new(Generator.new(65, 16807), Generator.new(8921, 48271)).tally(40_000_000)
# 588

p Judge.new(Generator.new(289, 16807), Generator.new(629, 48271)).tally(40_000_000)
