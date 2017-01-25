# Santa needs help figuring out which strings in his text file are naughty or
# nice.
#
# A nice string is one with all of the following properties:
#
#     It contains at least three vowels (aeiou only), like aei, xazegov, or
#     aeiouaeiouaeiou.
#     It contains at least one letter that appears twice in a row, like xx,
#     abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
#     It does not contain the strings ab, cd, pq, or xy, even if they are part
#     of one of the other requirements.

class String
  def nice?
    return false unless vowels_at_least?(3)
    return false unless repeating_letters?
    return !naughty_substrings?
  end

  def vowels_at_least?(n)
    scan(/[aeiou]/).count >= n
  end

  def repeating_letters?
    match(/(.)\1{1,}/)
  end

  def naughty_substrings?
    match(/ab|cd|pq|xy/)
  end
end

strings = File.readlines("./input/strings.txt")
puts strings.inject(0) {|total, string| string.nice? ? total + 1 : total}
