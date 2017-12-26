def eulers_totient(n)
  result = n
  (2..(n**0.5).to_i).each do |prime_factor|
    result -= result / prime_factor if n % prime_factor == 0
    n /= prime_factor while n % prime_factor == 0
  end
  result -= (result / n) if n > 1
  result
end

results = (0..10).map {|n| n.zero? ? 0 : n.to_f / eulers_totient(n)}
p results.index(results.max)

results = (0..1_000_000).map {|n| n.zero? ? 0 : n.to_f / eulers_totient(n)}
p results.index(results.max)
