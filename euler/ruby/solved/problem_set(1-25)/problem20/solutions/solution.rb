def sum_of_factorial_digits(n)
  (1..n).inject(:*).to_s.chars.map(&:to_i).inject(:+)
end

p sum_of_factorial_digits(10)
p sum_of_factorial_digits(100)
