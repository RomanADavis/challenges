# For example:
#
# 1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the
# second digit and the third digit (2) matches the fourth digit.
# 1111 produces 4 because each digit (all 1) matches the next.
# 1234 produces 0 because no digit matches the next.
# 91212129 produces 9 because the only digit that matches the next one is the
# last digit, 9.

require "minitest/autorun"
require_relative "../solutions/part1.rb"

describe "sum" do
  it "returns 3 for '1122'" do
    sum("1122").must_equal(3)
  end

  it "returns 4 for '1111'" do
    sum("1111").must_equal(4)
  end

  it "returns 0 for '1234'" do
    sum("1234").must_equal(0)
  end

  it "returns 9 for '91212129'" do
    sum("91212129").must_equal(9)
  end
end
