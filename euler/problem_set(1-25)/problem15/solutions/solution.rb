class Integer
  def factorial
    return 1 if self < 2
    self.downto(1).inject(:*)
  end

  def choose(k)
    self.factorial / (k.factorial * (self - k).factorial)
  end
end


# A bit of explanation is deserved here, I think. This is essentially a
# a combinatorics problem, where you are essentially choosing combinations of
# heads/ tails or lefts/ rights that end up in the same localation. This is a
# well studied problem, where n choose k essentially means, "given that you have
# to make 40 turns and 20 of them have to be lefts, how many ways can you
# make the trip." I could have also done something like:
# ("H" * 20 + "T" * 20).combinations.uniq.length
# or written some code to draw pascals triangle, but this is a lot faster.

p 40.choose(20)
