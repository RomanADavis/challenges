class Pangram
  def self.pangram?(phrase)
    ('A'..'Z').each do |letter|
      return false unless phrase.upcase.chars.include? letter
    end
    true
  end
end

module BookKeeping
  VERSION = 4
end
