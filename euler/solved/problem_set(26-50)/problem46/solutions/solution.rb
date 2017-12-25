def prime?(n)
  return false if n == 1
  return true  if n == 2
  return false if n % 2 == 0

  (3..(n**0.5).to_i).step(2) do |factor|
    return false if n % factor == 0
  end

  true
end

def conjecture?(n)
  return true if prime?(n) # Conjecture only applies to composites
  s = 1
  until (s**2) * 2 > n
    return true if prime?(n - s**2 * 2)
    s += 1
  end
  false
end

n = 35 # Last example given
n += 2 while conjecture?(n)
p n
