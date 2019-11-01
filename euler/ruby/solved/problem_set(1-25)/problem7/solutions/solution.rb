def prime(n) # get the nth prime number
  primes = [2]
  candidate = 3

  until primes.length == n
    # Only check candidate against primes under the square root of the candidate
    factors = primes[1..primes.find_index {|prime| prime > candidate**0.5}]
    primes << candidate if factors.all? {|prime| candidate % prime != 0}
    candidate += 2 # Only odd numbers after 2 can be prime.
  end

  primes.max
end

p prime(6)

p prime(10_001)
