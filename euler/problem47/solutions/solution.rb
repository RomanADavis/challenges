 # Really slow algo. Takes ~1 minute. I've hacked at it a little, but without
 # much improvement. Truth be told, when it printed the answer at all, I was a
 # a bit surprised.

require "set"

class Integer
  def factors
    return 0 if self == 0

    n = self
    factors = Set.new

    while n % 2 == 0
      n/= 2
      factors << 2
    end

    (3..n).step(2).each do |candidate|
      while n % candidate == 0
        n /= candidate
        factors << candidate
      end
      return factors.length if n == 1
    end

    factors
  end
end

def solve(n)
  counter = 1
  loop do
    sequence = counter...(counter + n)
    factors = sequence.map(&:factors)
    return counter if factors.all? {|factors| factors == n}
    counter += 1
  end
end

p 10.factors
p solve(2)
p solve(3)
p solve(4)
