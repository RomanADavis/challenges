#You're challenge for today is to create a program that can calculate pi
#accurately to at least 30 decimal places.
#Try not to cheat :)

# Sums the infinite series. Not sure how to get ruby to display past the 16th
#digit or so.
x = 1.0
pi = 0
1e7.to_i.times do
  pi += 4.0/x - 4.0/(x + 2.0)
  x+= 4.0
end

puts pi
