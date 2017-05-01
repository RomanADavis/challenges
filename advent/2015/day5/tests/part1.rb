require "minitest/autorun"
require "./solutions/part1.rb"

describe String do
  describe "vowels_at_least?" do
    it "returns true for strings containing at least n vowels" do
      "aei".vowels_at_least?(3).must_equal true
      "xazegov".vowels_at_least?(3).must_equal true
      "aeiouaeiouaeiou".vowels_at_least?(3).must_equal true
    end
  end

  describe "repeating_letters?" do
    it "has one letter that is the same character as one adjacent to it" do
      %w(xx abcdde aabbccdd)
        .each {|string| string.repeating_letters?.nil?.must_equal(false)}
    end
  end

  describe "naughty_substrings?" do
    it "returns true if it contains b, cd, pq, or xy" do

    end
  end

  describe "nice?" do
    it "returns true if nice" do
      "ugknbfddgicrmopn".nice?.must_equal true
      "aaa".nice?.must_equal true
    end

    it "returns false if naughty" do
      "jchzalrnumimnmhp".nice?.must_equal false
      "haegwjzuvuyypxyu".nice?.must_equal false
      "dvszwmarrgswjxmb".nice?.must_equal false
    end
  end
end
