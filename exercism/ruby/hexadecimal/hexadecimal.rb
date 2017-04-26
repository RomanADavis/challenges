class Hexadecimal
  HEX_TO_DEC = {'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15}
  def initialize(hex_string)
    @hex_string = hex_string.upcase
  end

  def to_decimal
    decimal_places = @hex_string.reverse.each_char.map do |char|
      char == char.to_i.to_s ? char.to_i : HEX_TO_DEC.fetch(char) {return 0}
    end
    total = 0
    decimal_places.each_with_index {|value, index| total += value * 16**index}
    total
  end
end
