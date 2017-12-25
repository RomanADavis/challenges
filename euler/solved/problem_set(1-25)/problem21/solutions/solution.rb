def sum_of_proper_divisors(n)
  divisors = [1]
  (2..((n**0.5).to_i)).each do |candidate|
    divisors += [candidate, n / candidate] if n % candidate == 0
  end

  divisors.uniq.inject(:+)
end

def amicable?(n)
  n == sum_of_proper_divisors(sum_of_proper_divisors(n)) && n != sum_of_proper_divisors(n)
end

puts (1...10_000).inject(0) {|total, n| amicable?(n) ? total + n : total}
