require_relative "part1.rb"

dance = DanceLine.new(('a'..'p').to_a, File.read("../input/dance_moves.txt"))

start = dance.run
cycle_length = 1_000_000_000
100.times do |n|
  dance.run

  cycle_length = n + 1 if dance.programs.join == start
end

dance = dance = DanceLine.new(('a'..'p').to_a, File.read("../input/dance_moves.txt"))

(1_000_000_000 % cycle_length).times {dance.run}

p dance.programs.join
