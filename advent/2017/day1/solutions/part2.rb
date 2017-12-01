# --- Part Two ---
#
# You notice a progress bar that jumps to 50% completion. Apparently, the door
# isn't yet satisfied, but it did emit a star as encouragement. The instructions
# change:
#
# Now, instead of considering the next digit, it wants you to consider the digit
# halfway around the circular list. That is, if your list contains 10 items,
# only include a digit in your sum if the digit 10/2 = 5 steps forward matches
# it. Fortunately, your list has an even number of elements.

def sum(digit_string)
  digits = digit_string.split('').map {|char| char.to_i}

  total = 0

  digit[0..(digits.length / 2)].each_with_index do |digit, index|
    total += digit * 2 if digit == digits[index + digits.length / 2]
  end

  total
end
