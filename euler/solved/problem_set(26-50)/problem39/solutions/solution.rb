def solutions_for_sum(sum)
  solutions = 0
  (1..(sum / 2)).each do |a|
    (1..a).each do |b|
      solutions += 1 if a**2 + b**2 == (sum - a - b)** 2
    end
  end

  solutions
end

p solutions_for_sum(120)

# Little slow. Takes tens of seconds to solve.
solutions = (0...1000).map.with_index {|sum| solutions_for_sum(sum)}
p solutions.index(solutions.max)
