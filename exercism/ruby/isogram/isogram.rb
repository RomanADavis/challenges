class Isogram
  def self.is_isogram?(string)
    chars = string.downcase.split.join.split('-').join.chars # Terrible hack

    chars.each do |char|
      return false if 1 < chars.count {|letter| letter == char}
    end

    true
  end
end

class BookKeeping
  VERSION = 3
end
