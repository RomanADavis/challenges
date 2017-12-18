# Alright, so we're trying to find numbers that are equal to the sum of their
# digits brought to fifth power. It says to get *all* the numbers that have this
# feature, but doesn't give a clear cap. However:
##  irb > 9**5
##  => 59049
# Okay, big number, but it'd take like 20 of those to get to even 7 digits, so
# it can be safe to say we've exhausted the possibilities when we start looking
# at 7 digit numbers. I suspect that, just like how all the digit 4th powers are
# all 4 digits long, all the digit 5th powers will turn out to be  5 digits
# long, but I can't prove that with such simple analyis. It's even worse for
# the lower bound, since 1**5 = 1.

def digit_powers(power)
  sums = []
  candidate = 10 # Needs two digits to be a sum
  until candidate >= 10**(power + 1) # Seems like a reasonable conjecture
    test = candidate.to_s.chars.map {|digit| digit.to_i**power}.inject(:+)
    sums << test if test == candidate
    candidate += 1
  end
  sums
end

p digit_powers(4) # Success
 # Conjecture was incorrect. Some are 4 and 6 digits long.
 # Also, unfortunately a tad slow. Takes several seconds.
p powers = digit_powers(5)
p powers.inject(:+)
