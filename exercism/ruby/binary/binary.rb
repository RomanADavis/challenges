class Binary
  def self.to_decimal(bit_string)
    values = bit_string.reverse.chars.map.with_index do |bit, index|
      raise(ArgumentError) unless "01".include? bit
      bit == '0' ? 0 : 2**index
    end
    values.inject(:+)
  end
end

module BookKeeping
  VERSION = 3
end
