class Abundant
  require "set"

  def self.proper_divisors(n)
    divisors = [1]
    (2..((n**0.5).to_i)).each do |candidate|
      divisors += [candidate, n / candidate] if n % candidate == 0
    end

    divisors.uniq
  end

  def self.abundant?(n)
    n < proper_divisors(n).inject(:+)
  end

  def self.abundant_sum?(n)
    @abundants.each do |abundant|
      return false if abundant > n
      return true if @abundants.include?(n - abundant)
    end
  end


  def self.solve
    @abundants = Set.new((1..28123).select {|n| abundant?(n)})
    cap = 28123
    (1..28123).inject {|total, n| abundant_sum?(n) ? total : total + n}
  end
end

p Abundant.solve
