# Wow. So first I made a naive solution that would make a bunch of Fraction
# objects, put them in an ungodly set and give the set's length. That was way
# too slow. Then I realized it should just add one if the gcf of the numerator
# and denominator was 1. That was less work for the set and was significantly
# faster, but I went to bed and got up again and it was still only a quarter way
# done.

# Then I learned about relative primeness and Euler's Totient. This is still a
# a little slow, but it's way faster.

def eulers_totient(n)
  result = n
  (2..(n**0.5).to_i).each do |prime_factor|
    result -= result / prime_factor if n % prime_factor == 0
    n /= prime_factor while n % prime_factor == 0
  end
  result -= (result / n) if n > 1
  result
end

p (2..8).inject(0) {|total, n| total + eulers_totient(n)}
p (2..1_000_000).inject(0) {|total, n| total + eulers_totient(n)}
