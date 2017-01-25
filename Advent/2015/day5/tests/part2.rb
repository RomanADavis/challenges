require "minitest/autorun"
require "./solutions/part2.rb"

describe String do
  describe "repeating_pairs?" do
    it "returns true for strings containing repeating pairs with no overlaps" do
      "xyxy".repeating_pairs?.must_equal true
      "aabcdefgaa".repeating_pairs?.must_equal true
      "aaa".repeating_pairs?.must_equal false
    end
  end

  describe "split_pair?" do
    it "returns true for strings containing pairs seperated by one letter" do
      "xyx".split_pair?.must_equal true
      "abcdefeghi".split_pair?.must_equal true
      "aaa".split_pair?.must_equal true
    end
  end

  describe "nice?" do
    it "returns true for nice strings" do
      "qjhvhtzxzqqjkmpb".nice?.must_equal true
      "xxyxx".split_pair?.must_equal true
      "xxyxx".repeating_pairs?.must_equal true
      "uurcxstgmygtbstg".nice?.must_equal false
      "ieodomkazucvgmuy".nice?.must_equal false
    end
  end
end
