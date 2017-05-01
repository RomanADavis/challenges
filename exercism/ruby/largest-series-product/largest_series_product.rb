class Series
  def initialize(string_of_digits)
    if string_of_digits.chars.any? {|digit| digit != digit.to_i.to_s}
      raise ArgumentError, "#{string_of_digits} is not a valid number sequence."
    end

    @string = string_of_digits
    @digits = string_of_digits.chars.map(&:to_i)
  end

  def largest_product(length)
    return 1 if length.zero?

    if @digits.length < length
      raise ArgumentError, "#Length: {length} should not be bigger than the length of #{@string}"
    end

    adjacent_digits = @digits.each_cons(length)
    products_of_adjacent = adjacent_digits.map {|digits| digits.inject(:*)}
    products_of_adjacent.max
  end
end

module BookKeeping
  VERSION = 3
end
