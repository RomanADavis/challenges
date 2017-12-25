require "set"

class Pandigital
  def self.all # 1..9 & 1..8 are always divisible by 9 & 3!
    (1..7).map(&:to_s).permutation.map {|permutation| permutation.join.to_i}
  end

  def self.solve
    candidates = all.reject {|candidate| candidate % 2 == 0}
    primes = []
    cap = (candidates.max**0.5).to_i

    (3..cap).step(2).each do |n|
      candidates.reject! {|candidate| candidate % n == 0}
    end

    candidates.max
  end
end

p Pandigital.solve
