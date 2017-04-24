class Anagram < Struct.new(:word, :letters)
  def initialize(word)
    self.word = word.downcase
    self.letters = word.downcase.chars.sort
  end

  def match(words)
    words.select do |word|
      word.downcase.chars.sort == self.letters && word.downcase != self.word
    end
  end
end

module BookKeeping
  VERSION = 2
end
