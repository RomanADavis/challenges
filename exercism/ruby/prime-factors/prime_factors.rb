class PrimeFactors
  def self.for(value)
    factors, prime = [], 2
    while value > 1
      while value % prime == 0
        factors << prime
        value /= prime
      end
      prime += 1
    end
    factors
  end
end
