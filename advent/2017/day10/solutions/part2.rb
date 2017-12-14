require_relative "part1"

class KnotHash
  def initialize(input, tail = 255)
    self.lengths = salt(input)
    self.content = (0..tail).to_a
    self.position = 0
    self.skip_size = 0
  end

  def salt(input)
    input.chars.map(&:ord) + [17, 31, 73, 47, 23]
  end

  def sparse_hash
    64.times {twist_all}

    self.content
  end

  def dense_hash
    sparse_hash.each_slice(16).map {|block| block.inject(:^)}
  end

  def generate
    dense_hash.map {|digit| digit.to_s(16).rjust(2, '0')}.join
  end
end

p KnotHash.new('').generate

input = "106,118,236,1,130,0,235,254,59,205,2,87,129,25,255,118"

p KnotHash.new(input).generate
