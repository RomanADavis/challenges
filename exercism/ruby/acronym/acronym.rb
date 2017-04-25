class Acronym
  def self.abbreviate(string)
    letters = string.split.map do |word|
      multicapitalized = word != word.upcase && word != word.downcase
      char = word[0]
      char += word[1..-1].scan(/[A-Z]/).join if multicapitalized
      char += word.scan(/(?<=-)./).join if word.include?('-')
      char.upcase
    end
    letters.join
  end
end

module BookKeeping
  VERSION = 2
end
