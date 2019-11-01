require "set"

# Takes several seconds. Could stand to speed up divisors in particular.

def triangle(n)
  (n *(n + 1)) / 2
end

def divisors(n)
  divisors = Set.new([1, n])
  candidate = 2
  until candidate > n**0.5
    divisors += [candidate, n / candidate] if n % candidate == 0
    candidate += 1
  end

  divisors
end

def triangle_with_more_divisors_than(n)
  candidate = 1
  candidate += 1 until divisors(triangle(candidate)).length > n
  triangle(candidate)
end

p triangle(7)
p divisors(triangle(7))
p triangle_with_more_divisors_than(5)
p triangle_with_more_divisors_than(500)
