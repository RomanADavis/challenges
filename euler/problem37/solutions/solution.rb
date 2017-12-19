require "set"
class Prime
  def initialize
    @primes = primes_under(1_000_000)
  end

  def truncatable_primes
    @primes.select {|prime| truncatable?(prime)}.reject do |prime|
      prime.to_s.length < 2
    end
  end

  def primes_under(n)
    candidates = (3...n).step(2).to_a
    primes = []

    until candidates[0] > n**0.5
      primes << candidates.shift
      candidates.reject! {|candidate| candidate % primes[-1] == 0}
    end

    SortedSet.new([2] + primes + candidates)
  end

  def right_truncatable?(n)
    return false unless @primes.include?(n)
    return true if n < 10
    right_truncatable?(n.to_s[0...-1].to_i)
  end

  def left_truncatable?(n)
    return false unless @primes.include?(n)
    return true if n < 10
    left_truncatable?(n.to_s[1..-1] .to_i)
  end

  def truncatable?(n)
    right_truncatable?(n) && left_truncatable?(n)
  end
end

p Prime.new.truncatable_primes.inject(:+)
