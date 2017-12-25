class String
  def value
    self.chars.inject(0) {|total, char| total + (char.ord - 'A'.ord + 1)}
  end
end

class Integer
  def triangle
    ((self + 1) * self)/ 2
  end
end

words = File.read("../input/input.txt").chomp.split(',').map {|word| word[1...-1]}

values = words.map(&:value)
                ## Reverse triangle
triangles = (0..(values.max * 2)**0.5).map {|n| n.triangle}

p values.select {|value| triangles.include? value}.count
