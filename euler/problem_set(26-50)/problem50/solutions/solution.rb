class Primes
  def self.under(n)
    candidates = (3..n).step(2).to_a
    primes     = [2]
    cap        = n**0.5

    until candidates.empty? || primes.last > cap
      primes << candidates.shift
      candidates.reject! {|candidate| candidate % primes.last == 0}
    end

    primes + candidates
  end

  def self.longest_consecutive_sum_under(n)
    primes       = under(n)
    longest      = 2 # First prime
    section_size = 2

    until primes[0...section_size].inject(:+) > n
      primes.each_cons(section_size) do |section|
        sum = section.inject(:+)
        break if sum > n
        break longest = sum if primes.include?(sum)
      end
      section_size += 1
    end

    longest
  end
end

p Primes.longest_consecutive_sum_under(10)
p Primes.longest_consecutive_sum_under(100)
p Primes.longest_consecutive_sum_under(1_000)

# Takes about a minute, unfortunately. :( Hopefully I'll get a chance to look
# over some neat algos for this in the comment section.
p Primes.longest_consecutive_sum_under(1_000_000)
