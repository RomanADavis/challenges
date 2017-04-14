class Prime
  def self.nth(n)
    raise ArgumentError if n < 1
    primes = []
    candidate = 2 # 1 is not prime

    while primes.length < n
      primes << candidate unless primes.any? {|prime| candidate % prime == 0}
      candidate += 1
    end

    primes.last
  end
end

module BookKeeping
  VERSION = 1
end
