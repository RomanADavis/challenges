class Hamming
  def compute(a, b)
    distance = 0
    a.chars.with_index do |char, index|
      distance += 1 if char != b[index]
    end
    distance
  end
end
