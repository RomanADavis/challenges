require "minitest/autorun"
require "./solutions/part1"

describe "coinmine" do
  it "renders a hash with fives 0s" do
    coinmine("abcdef").must_equal 609043
    coinmine("pqrstuv").must_equal 1048970
  end
end
