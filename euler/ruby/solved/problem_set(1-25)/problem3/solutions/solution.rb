require "set"

def prime_factors(n)
  candidates = Set.new()
  candidate = 2
  while n > 1
    while n % candidate == 0
      candidates << candidate
      n /= candidate
    end
    candidate += 1
  end
  candidates
end

p prime_factors(13195).max
p prime_factors(600851475143).max
