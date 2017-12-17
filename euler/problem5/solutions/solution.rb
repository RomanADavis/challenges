def smallest_multiple(range)
  max = range.inject(:*)
  range.to_a[1..-1].reverse.each do |divisor|
    while range.all? {|factor| (max / divisor) % factor == 0}
      max /= divisor
    end
  end

  max
end

p smallest_multiple(1..10)
p smallest_multiple(1..20)
