require_relative "part1"
e = Emulator.new(File.readlines("./input/instructions.txt"))
a = e.calculate('a')
memory = File.read("./input/instructions.txt").gsub(/\d\d\d\d\d -> b/, "3176 -> b")
e = Emulator.new(memory.split("\n"))
puts e.calculate("a")
