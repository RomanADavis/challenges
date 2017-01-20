require "minitest/autorun"

describe Euler1Test do
  describe "Integer#multiple_of?" do
    it "returns true when self is divisible by it's argument" do
      5.multiple_of?(5).must_equal true
      11.multiple_of(1).must_equal true
    end

    it "returns false when self is NOT divisible by it's argument" do
      4.divisible_by(5).must_equal false
    end
  end
end
