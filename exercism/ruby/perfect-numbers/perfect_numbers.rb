class PerfectNumber
  def self.aliquot_sum(number) # Left public because it might be useful.
    raise RuntimeError, "#{number} must be positive." if number < 0

    factors = (1..(number/2)).select {|factor| number % factor == 0}
    sum = factors.inject(:+)
  end

  def self.classify(number)
    sum = aliquot_sum(number)

    return "deficient" if sum < number
    return "abundant" if sum > number
    "perfect"
  end
end

module BookKeeping
  VERSION = 1
end
