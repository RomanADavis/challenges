# def eulers_totient(n)
#   result = n
#   (2..(n**0.5).to_i).each do |prime_factor|
#     result -= result / prime_factor if n % prime_factor == 0
#     n /= prime_factor while n % prime_factor == 0
#   end
#   result -= (result / n) if n > 1
#   result
# end
#
# results = (0..10).map {|n| n.zero? ? 0 : n.to_f / eulers_totient(n)}
# p results.index(results.max)
#
# results = (0..1_000_000).map {|n| n.zero? ? 0 : n.to_f / eulers_totient(n)}
# p results.index(results.max)
#
# The algo above works, but is pretty slow and only worked after looking up a
# fast formula for calculating euler's totient.
# This method works *way* faster. Basically, this fast form of euler's totient
# can be calculated by finding the prime factors, and the number with the
# largest number of prime factors is the largest multiple of the smallest primes
# under 1_000_000.
 
def primes_under(n)
  candidates = (3...n).step(2).to_a
  primes = [2]
  until primes[-1] > n**0.5
    primes << candidates.shift
    candidates.reject! {|candidate| candidate % primes[-1] == 0}
  end
  primes + candidates
end

primes = primes_under(100)
total = 1
total *= primes.shift until primes[0] * total > 1_000_000

p total
