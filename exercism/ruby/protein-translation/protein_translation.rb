class Translation
  CODON_TO_ACID = {# Mixed feelings about rather this is a good practice or not
    "AUG" => "Methionine", "UUU" => acid = "Phenylalanine", "UUC" => acid,
    "UUA" => acid = "Leucine", "UUG" => acid, "UCU" => acid = "Serine",
    "UCC" => acid, "UCA" => acid, "UCG" => acid, "UAU" => acid = "Tyrosine",
    "UAC" => acid, "UGU" => acid = "Cysteine", "UGC" => acid,
    "UGG" => "Tryptophan", "UAA" => "STOP", "UAG" => "STOP", "UGA" => "STOP"
  }

  def self.of_codon(codon)
    CODON_TO_ACID.fetch(codon) do
      raise InvalidCodonError, "#{codon} is not a valid codon"
    end
  end

  def self.of_rna(rna_string)
    codons = rna_string.scan(/.{3}/)
    acids = codons.map {|codon| of_codon(codon)}
    acids.take_while {|codon| codon != "STOP"}
  end
end

class InvalidCodonError < StandardError
end
