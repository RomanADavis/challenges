# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

candidate = 2
primes = []
until candidate > 2_000_000
  prime = true

  primes.each  do |number|
    break if number * number > candidate
    break prime = false if candidate % number == 0
  end
  
  primes << candidate if prime
  candidate += 1
end

puts primes.inject(:+)
