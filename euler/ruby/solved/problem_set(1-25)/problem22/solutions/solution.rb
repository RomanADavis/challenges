names = File.read("../input/names.txt").chomp.split(",").map {|n| n[1..-2]}

names.sort!.map!.with_index do |name, index|
  name.chars.inject(0) do |total, char|
    total + ((char.ord - 'A'.ord + 1) * (index + 1))
  end
end

p names.inject(:+)
