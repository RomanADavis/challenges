class Nucleotide
  attr_accessor :histogram
  def initialize
    self.histogram = {'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0}
  end

  def self.from_dna(bases)
    dna = self.new
    raise ArgumentError unless bases.chars.all? {|char| dna.histogram[char]}
    bases.each_char {|nucleotide| dna.histogram[nucleotide] += 1}
    dna
  end

  def count(nucleotide)
    self.histogram[nucleotide]
  end
end
