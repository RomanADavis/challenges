# Little slow. Less than a minute, but still takes some time.

def pandigital_product?(a, b, product)
  [a, b, product].map(&:to_s).join.chars.sort == ('1'..'9').to_a
end

products = []

(1..2_000).each do |a|
  (1..a).each do |b|
    product = a * b
    p products << product if pandigital_product?(a, b, product) && !products.include?(product)
  end
end

p products.uniq.inject(:+)
