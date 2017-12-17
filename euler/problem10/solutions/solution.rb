# Takes about a minute on my computer. Wondering how I can make this faster.
def primes_under(n)
  primes = [2]
  candidate = 3

  while candidate < n
    factors = primes[1...primes.index {|prime| prime > candidate**0.5 }]
    primes << candidate unless factors.any? {|factor| candidate % factor == 0}
    candidate += 2
  end

  primes
end

# Way faster. Still takes a couple seconds, though.
def primes_under(n)
  candidates = (3..n).step(2).to_a
  primes = [2]

  until primes.last > n ** 0.5
    primes << candidates.shift
    candidates.reject! {|candidate| candidate % primes[-1] == 0}
  end

  primes + candidates
end

p primes_under(10).inject(:+)
p primes_under(2_000_000).inject(:+)
