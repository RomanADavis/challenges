def solve(cap) # Add up all n less than cap divisible by 5 or 3
  (1..(cap - 1)).lazy.inject(0) do |total, n|
    n % 5 == 0 || n % 3 == 0 ? total + n : total
  end
end

p solve(10)
p solve(1_000)
