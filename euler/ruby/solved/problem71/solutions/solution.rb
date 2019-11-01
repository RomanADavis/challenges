# Ugly as sin. But it's work fast. :)

max = 3.0 / 7.0
min = 0
numerator_min = 1
result = 1
(2..8).each do |denominator|
  (numerator_min...denominator).each do |numerator|
    candidate = numerator.to_f / denominator
    break if candidate >= max
    if candidate > min
      numerator_min = numerator
      min = candidate
      result = numerator
    end
  end
end

p result

(2..1_000_000).each do |denominator|
  (numerator_min...denominator).each do |numerator|
    candidate = numerator.to_f / denominator
    break if candidate >= max
    if candidate > min
      numerator_min = numerator
      min = candidate
      result = numerator
    end
  end
end

p result
