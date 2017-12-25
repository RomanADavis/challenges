def sum_of_squares(range)
  range.map {|n| n**2}.inject(:+)
end

def square_of_sum(range)
  range.inject(:+) ** 2
end

def solve(range)
  square_of_sum(range) - sum_of_squares(range)
end

p solve(1..10)
p solve(1..100)
