#     ) causes him to enter the basement at character position 1.
#     ()()) causes him to enter the basement at character position 5.

require "minitest/autorun"
require "./lib/part2"
describe "basement" do
  it "returns the index at wnich paren depth is -1" do
    basement(")").must_equal 1
    basement("()())").must_equal 5
  end
end
