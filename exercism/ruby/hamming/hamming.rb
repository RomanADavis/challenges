class Hamming
  def self.compute(a, b)
    raise(ArgumentError) if a.length != b.length
    a.chars.each.with_index.count { |char, index| char != b[index] }
  end
end

module BookKeeping
  VERSION = 3
end
