# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

class Integer
  def prime_factors
    n = self
    factors = []
    i = 2
    until n == 1
      while n % i == 0
        factors << i
        n /= i
      end
      i += 1
    end
    factors
  end
end

## TEST
p 13195.prime_factors

p 600851475143.prime_factors.max
