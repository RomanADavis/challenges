class Phrase < Struct.new(:content, :word_count)
  def initialize(content)
    self.content = content.downcase
    self.word_count = {}
    count_matches(/[a-z]+'*[a-z]/)
    count_matches(/\d+/)
  end

  def count_matches(match)
    self.content.scan(match).to_a.each do |word|
      self.word_count[word] ? self.word_count[word] += 1 : self.word_count[word] = 1
    end
  end
end

module BookKeeping
  VERSION = 1
end
