# This is a little *too* easy. There's a really interesting way of implementing
# a function that can get the fib number by its index. I'll need to implement it
# sometime.

a, b, index = 1, 0, 1
while a.to_s.length < 1000
  a, b = a + b, a
  index += 1
end

p index
