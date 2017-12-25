def quadratic_formula(a, b)
  ->(n){n**2 + (a * n) + b}
end

def prime?(n)
  return false if n % 2 == 0
  candidate = 3

  until candidate > n.abs**0.5
    return false if n % candidate == 0
    candidate += 2
  end

  true
end

def solve
  max = product = 0
  (-1000..1000).each do |a|
    (-1000..1000).each do |b|
      formula = quadratic_formula(a, b)
      n = 0
      n += 1 while prime?(formula.call(n))
      max, product = n, a * b if n > max
      #p [a, b, max, product]
    end
  end

  product
end

p solve
