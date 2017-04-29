class PigLatin
  VOWELS = ['a', 'e', 'i', 'o', 'u', 'y']
  def self.translate(string)
    string.split.map {|word| latinize(word)}.join(' ')
  end

  def self.latinize(word)
    starting_sound = ""

    while !VOWELS.include?(word[0]) || # starts with a consonant
      (word[0] == 'u' && starting_sound[-1] == 'q') || # u following a q
      (word[0] == 'y' && VOWELS.include?(word[1]))# y acting as a vowe
      break if word[0] == 'x' && !VOWELS.include?(word[1])
      starting_sound += word[0]
      word = word[1..-1]
    end

    "#{word}#{starting_sound}ay"
  end
end

module BookKeeping
  VERSION = 1
end
