# --- Part Two ---
#
# Realizing the error of his ways, Santa has switched to a better model of
# determining whether a string is naughty or nice. None of the old rules apply,
# as they are all clearly ridiculous.
#
# Now, a nice string is one with all of the following properties:
#
#     It contains a pair of any two letters that appears at least twice in the
#     string without overlapping, like xyxy (xy) or aabcdefgaa (aa), but not
#     like aaa (aa, but it overlaps).
#     It contains at least one letter which repeats with exactly one letter
#     between them, like xyx, abcdefeghi (efe), or even aaa.

class String
  def nice?
    repeating_pairs? && split_pair?
  end

  def repeating_pairs?
    pairs = self.chars.each_cons(2).to_a.map(&:join)
    until pairs.length == 1
      pair = pairs.shift
      return true if pairs[1..-1].include?(pair)
    end
    false
  end

  def split_pair?
    self.chars.each_cons(3) {|a, b, c| return true if a == c}
    false
  end
end

puts File.readlines("./input/strings.txt").count {|string| string.nice?}
