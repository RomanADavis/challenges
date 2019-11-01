input = File.readlines("../input/input.txt")

input.map! {|line| line.split(',')[0].to_i**line.split(',')[1].to_i}
p input.find_index(input.max) + 1
