# A present with dimensions 2x3x4 requires 2*6 + 2*12 + 2*8 = 52 square feet of
# wrapping paper plus 6 square feet of slack, for a total of 58 square feet.

# A present with dimensions 1x1x10 requires 2*1 + 2*10 + 2*10 = 42 square feet
# of wrapping paper plus 1 square foot of slack, for a total of 43 square feet.

require "minitest/autorun"
require "./solutions/part1"

describe "wrapping" do
  it "return the surface of a cube plus it's smallest size" do
    wrapping("2x3x4").must_equal 58
    wrapping("1x1x10").must_equal 43
  end
end
