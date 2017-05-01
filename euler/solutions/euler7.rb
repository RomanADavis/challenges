# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.
# What is the 10 001st prime number?

prime_count = 0
primes = []
candidate = 2
while primes.length < 10_001
  is_prime = true
  primes.each {|prime| is_prime = false if (candidate % prime).zero?}
  primes << candidate if is_prime
  candidate += 1
end

puts primes[-1]
