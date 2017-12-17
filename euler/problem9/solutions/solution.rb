# Brute force method of finding a pythogorean triple and returning their product,
# given that one exists. Reminder to go find a better formula.
def solve(n)
  (1..(n / 2)).each do |a|
    (1..a).each do |b|
      c = (a**2 + b**2) ** 0.5
      return (a * b * c).to_i if a + b + c == 1000
    end
  end
  nil
end

p solve(1000)
