class String
  def nice?
    return false unless three_vowels?
    return false unless double_letter?
    !forbidden_substrings?
  end

  def three_vowels?
    scan(/[aeiou]/).count > 2
  end

  def double_letter?
    chars.each_with_index {|letter, index| return true if letter == self[index + 1]}
    false
  end

  def forbidden_substrings?
    ["ab", "cd", "pq", "xy"].each {|substring| return true if include?(substring)}
    false
  end
end

list = File.read("./input/day5.txt").chomp.split("\n")
p list.count {|string| string.nice?}
