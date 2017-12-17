input = File.readlines("../input/input.txt").map {|line| line.chomp}.join.to_i

def greatest_product_for_adjacent(large_n, length)
  sequences = large_n.to_s.chars.map(&:to_i).each_cons(length)
  candidates = sequences.map {|cons| cons.inject(:*)}
  candidates.max
end

p greatest_product_for_adjacent(input, 4)
p greatest_product_for_adjacent(input, 13)
