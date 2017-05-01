# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
(300..800).each do |c|
  (100..(1_000 - c)).each do |b|
    a = 1000 - b - c
    break puts a*b*c if a**2 + b**2 == c**2
  end
end
