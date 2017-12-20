def distinct_powers(range)
  powers = (range).map do |a|
    (range).map {|b| a**b}
  end
  powers.flatten.uniq.sort
end

p distinct_powers(2..5)
p distinct_powers(2..100).count
