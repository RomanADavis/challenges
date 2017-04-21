class Trinary < Struct.new(:tri_string)
  def initialize(tri_string)
    self.tri_string = tri_string
  end

  def to_decimal
    return 0 unless self.tri_string.chars.all? {|tri| "012".include? tri}
    values = tri_string.reverse.chars.map.with_index do |char, index|
      char.to_i * 3**index
    end
    values.inject(:+)
  end
end

class BookKeeping
  VERSION = 1
end
