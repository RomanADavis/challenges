# For example:
#
#     (()) and ()() both result in floor 0.
#     ((( and (()(()( both result in floor 3.
#     ))((((( also results in floor 3.
#     ()) and ))( both result in floor -1 (the first basement level).
#     ))) and )())()) both result in floor -3.

require "minitest/autorun"
require_relative "../part1.rb"

describe "floor" do
  it "returns zero if Santa has gone up or down any stairs" do
    floor("").must_equal(0)
  end

  it "returns a neqative number if Santa has only gone down stairs" do
    (floor("))") < 0).must_equal true
  end

  it "returns a positive number if Santa has only gone up stairs" do
    (floor("((") > 0).must_equal true
  end

  it "(()) and ()() both result in floor 0" do
    floor("(())").must_equal 0
    floor("()()").must_equal 0
  end

  it "((( and (()(()( both result in floor 3" do
    floor("(((").must_equal 3
    floor("(()(()(").must_equal 3
  end

  it "))((((( also results in floor 3" do
    floor("))(((((").must_equal 3
  end

  it "()) and ))( both result in floor -1 (the first basement level)" do
    floor("())").must_equal -1
    floor("))(").must_equal -1
  end

  it "))) and )())()) both result in floor -3" do
    floor(")))").must_equal -3
    floor(")())())").must_equal -3
  end
end
