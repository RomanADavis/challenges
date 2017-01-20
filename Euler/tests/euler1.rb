require "minitest/autorun"
require "./lib/solutions/euler1"
describe Integer do
  describe "multiple_of?" do
    it "returns true when self is divisible by it's argument" do
      5.multiple_of?(5).must_equal true
      11.multiple_of?(1).must_equal true
    end

    it "returns false when self is NOT divisible by it's argument" do
      4.multiple_of?(5).must_equal false
    end
  end
end

describe NaturalNumbers do
  describe "under" do
    it "makes an array of numbers under it's argument" do
      NaturalNumbers.under(4).must_equal [1, 2, 3]
    end
  end
end

describe Array do
  describe "sum" do
    it "it sums all the members of an array if no block is given" do
      [1, 2 , 3].sum.must_equal 6
    end
  end
end
