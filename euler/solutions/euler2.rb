total, a, b = 0, 0, 1
while b < 4_000_000
  a, b = b, a + b
  total += b if b.even?
end

p total
