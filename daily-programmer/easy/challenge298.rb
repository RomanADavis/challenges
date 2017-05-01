# Difficulty may be higher than easy,
#
# (((3))) is an expression with too many parentheses.
#
# The rule for "too many parentheses" around part of an expression is that if
# removing matching parentheses around a section of text still leaves that
# section enclosed by parentheses, then those parentheses should be removed as
# extraneous.
#
# (3) is the proper stripping of extra parentheses in above example.
#
# ((a((bc)(de)))f) does not have any extra parentheses. Removing any matching
# set of parentheses does not leave a "single" parenthesesed group that was
# previously enclosed by the parentheses in question.

def matching_parens(code)
  pairs = []
  depth = 0
  depth_position = {}
  string.chars.each_with_index do |char, position|
    if char == "("
      depth_position[depth] = position
      depth += 1
    elsif char == ")"
      pairs << [depth_position[depth], position]
      depth -= 1
    end
  end
  pairs
end

def strip_parens(code)
  parens = matching_parens(code)
  parens.each do |paren|
    if paren.any? {|par| par == [parens[0] + 1, parens[1] - 1]}
      code.slice!(paren.first)
      code.slice!(paren.last)
    end
  end
  code
end
