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
end
