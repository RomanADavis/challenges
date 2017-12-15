class Generator
  attr_accessor :seed, :factor, :criteria
  def initialize(seed, factor, criteria)
    self.seed   = seed
    self.factor = factor
    self.criteria = criteria
  end

  def next
    until self.seed % self.criteria == 0
      self.seed = self.seed * self.factor % 2147483647
    end

    self.seed
  end
end

class Judge
  attr_accessor :generators, :matches
  def initialize(*generators)
    self.generators = generators
    self.matches    = 0
  end

  def match? # Check if the last sixteen bits of the next seed match for all generators
    generators.map do |generator|
      generator.next #& 0xFFFF
    end #.uniq.length == 1
  end

  def round
    p self.generators
    self.matches += 1 if match?
  end

  def tally(rounds)
    rounds.times {round}

    self.matches
  end
end

p Judge.new(Generator.new(65, 16807, 4), Generator.new(8921, 48271, 8)).tally(5)
