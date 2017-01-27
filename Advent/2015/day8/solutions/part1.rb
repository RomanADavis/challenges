input = File.read("./input/strings.txt").chomp.split("\n")
code_count = input.inject(0) {|total, string| total + string.length}
char_count = input.inject(0) {|total, string| total + eval(string).length}

puts code_count - char_count
