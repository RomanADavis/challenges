# For example:
#
# 1212 produces 6: the list contains 4 items, and all four digits match the
# digit 2 items ahead.
# 1221 produces 0, because every comparison is between a 1 and a 2.
# 123425 produces 4, because both 2s match each other, but no other digit has a
# match.
# 123123 produces 12.
# 12131415 produces 4.

require "minitest/autorun"
require_relative "../solutions/part2.rb"

describe "sum" do
  it "must return 6 for '1212'" do
    sum('1212').must_equal(6)
  end
  it "must return  0 for '1221" do
    sum('1221').must_equal(0)
  end
  it "must return 4 for '123425'" do
    sum('123425').must_equal(4)
  end
  it "must return 12 for '123123'" do
    sum('123123').must_equal(12)
  end
  it "must return 4 for '12131415'" do
    sum('12131415').must_equal(4)
  end
end
