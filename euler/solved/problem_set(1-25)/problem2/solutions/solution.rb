def fibs_under(cap)
  a, b, total = 1, 0, 0
  while a < cap
    total += a if a % 2 == 0
    c = a
    a += b
    b = c
  end
  total
end

p fibs_under(4_000_000)
