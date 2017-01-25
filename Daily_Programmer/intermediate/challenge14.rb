# Your task is to implement the sieve of Sundaram and calculate the list of
# primes to 10000.
# this is also an interesting article about it.

def sieve number
  number = number / 2
  marked = Hash.new
  (1..((number - 1) /3)).each do |i|
    (1..i).each do |j|
      marked[i + j + 2 * i * j] = true
    end
    marked[i + 2i] = false
  end

  puts 2,
end
