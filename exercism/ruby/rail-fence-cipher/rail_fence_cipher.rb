class RailFenceCipher
  def self.encode(string, number)
    return string if number == 1
    rails = [""] * number
    index, change = 0, 1
    string.chars.each do |char|
      rails[index] += char
      index += change
      change *= -1 if index == 0 || index == number - 1
    end
    rails.join
  end

  # Coming up with solutions for 1, 2, or 3 is pretty simple, but once it gets
  # higher than that, I get pretty confused and I'm still trying to think of a
  # of a solution for the general case.
  def self.decode
  end
end
