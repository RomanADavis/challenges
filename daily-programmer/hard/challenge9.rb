# The U.S government has commissioned you to catch the terrorists!
# There is a mathematical pyramid with the following pattern:
# 1
# 11
# 21
# 1211
# 111221
# 312211
# you must write a program to calculate up to the 40th line of this pyramid. If
# you don't, the terrorists win!

def lower_level(upper_level)
  lower, brick = "", nil
  upper_level.chars.map do |char|
    if brick.nil? || brick[1] != char
      lower += brick[0].to_s + brick[1] if brick
      brick = [1, char]
    else
      brick[0] += 1
    end
  end
  lower + brick[0].to_s + brick[1]
end

#=#=#=#=#=#= GHETTO TESTS =#=#=#=#=#=#=#=#=#+#=#=#=#+#
# puts lower_level "1"
# puts lower_level "11"
# puts lower_level "21"
# puts lower_level "1211"

def pyramid
  upper_level = "1"
  triangle = [upper_level]
  40.times do
    triangle << upper_level = lower_level(upper_level)
  end
  triangle
end

puts pyramid[39]
