class Scrabble
  attr_accessor :score
  def initialize(word)
    set_up_tiles
    self.score = word.to_s.upcase.chars.inject(0) do |sum, char|
      sum += @letter_to_points[char]
    end
  end

  def self.score(word)
    self.new(word).score
  end

  private
    def set_up_tiles
      @letter_to_points = Hash.new(0)
      ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'].each do |letter|
        @letter_to_points[letter] = 1
      end
      ['D', 'G'].each {|letter| @letter_to_points[letter] = 2}
      ['B', 'C', 'M', 'P'].each {|letter| @letter_to_points[letter] = 3}
      ['F', 'H', 'V', 'W', 'Y'].each {|letter| @letter_to_points[letter] = 4}
      @letter_to_points['K'] = 5
      ['J', 'X'].each {|letter| @letter_to_points[letter] = 8}
      ['Q', 'Z'].each {|letter| @letter_to_points[letter] = 10}
    end
end
