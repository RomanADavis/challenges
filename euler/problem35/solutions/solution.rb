def primes_under(n)
  candidates = (3...n).step(2).to_a
  primes = []
  until candidates[0] > n**0.5
    primes << candidates.shift
    candidates.reject! {|candidate| candidate % primes[-1] == 0}
  end
  [2] + primes + candidates
end

def circular_primes_under(n) # Really only works for powers of ten :/
  circular_primes = []
  primes = primes_under(n)
  primes.each do |prime|
    rotations = prime.to_s.length.times.map {|index| prime.to_s.chars.rotate(index)}
    rotations = rotations.map {|rotation| rotation.join.to_i}
    circular_primes << prime if rotations.all? {|rotation| primes.include? rotation}
  end
  circular_primes
end

p circular_primes_under(100) # Checks out
# Takes about a minute. Makes me think my algo is a tad slow. Fans are
# screaming, all to print 55.
p circular_primes_under(1_000_000).count
