# So,just some thoughts on a cap. For 987654321, our highest possible value,
# it needs to be concactanated from at least two products, which puts the cap
# on products, just with eyeball analysis, at 9876 / 1.

def pandigital?(n)
  n.chars.sort == ('1'..'9').to_a
end

def multiple(candidate)
  digits = ""
  n = 2
  until digits.length > 8
    digits = (1..n).map {|n| candidate * n}.map(&:to_s).join
    n += 1
  end

  digits
end

pandigitals = []
cap = 9876
(1..cap).each do |candidate|
  digits = multiple(candidate)
  p pandigitals << digits.to_i if pandigital?(digits)
end

p pandigitals.max
