class KnotHash
  attr_accessor :input, :lengths, :content, :position, :skip_size

  def initialize(input, tail = 255)
    self.input     = input
    self.lengths   = salt(input)
    self.content   = (0..tail).to_a
    self.position  = 0
    self.skip_size = 0
  end

  def self.diskhash(input)
    (0..127).collect do |n|
      KnotHash.new("#{input}-#{n}").generate
    end
  end

  def self.count(input)
    diskhash(input).inject(0) do |total, hash|
      total + hash.hex.to_s(2).chars.count {|char| char == '1'}
    end
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

  def checksum
    # p self.content
    twist_all

    self.content[0..1].inject(:*)
  end

  def twist_all
    self.lengths.each do |length|
      twist(length)
      self.position = (self.position + length + self.skip_size) % self.content.length
      self.skip_size += 1
    end
  end

  def reverse_subsection(length)
    tail = self.position + length
    mirror = self.content[position..(tail - 1)] || []

    if mirror.length < length
      mirror += self.content[0..(length - mirror.length - 1)]
    end

    mirror = mirror.reverse
  end

  def twist(length)
    mirror = reverse_subsection(length)

    self.content.each_with_index do |_, index|
      self.content[index] = mirror.shift if index >= position && mirror[-1]
    end

    mirror.each_with_index do |value, index|
      self.content[index] = value
    end

    self.content
  end
end

p KnotHash.count("flqrgnkx")
p KnotHash.count("stpzcrnm")
