class Complement
  def self.of_dna(bases)
    pairs = {"G" => "C", "C" => "G", "T" => "A", "A" => "U"}

    rna = bases.chars.each.map do |base|
      return "" unless pairs[base]
      pairs[base]
    end

    rna.join
  end
end

module BookKeeping
  VERSION = 4
end
