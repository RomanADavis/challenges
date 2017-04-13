primes = Struct.new(:primes)

class Sieve < primes
  def initialize(n)
    self.primes = []
    (2..n).each do |candidate|
      is_prime = !self.primes.any? {|prime| candidate % prime == 0}
      self.primes << candidate if is_prime
    end
  end
end

module BookKeeping
  VERSION = 1
end
