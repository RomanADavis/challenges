class BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError, "Negative digt" if digits.any? {|digit| digit.negative?}
    raise ArgumentError, "Invalid base" if input_base < 2 || output_base < 2

    number = self.to_i(input_base, digits)
    return [] if number.nil?

    self.to_digits(output_base, number)
  end

  def self.to_i(input_base, digits)
    raise ArgumentError, "Invalid digit for base" unless digits.all? {|digit| digit < input_base}

    terms = digits.reverse.map.with_index do |digit, place|
      digit * input_base**place
    end

    terms.inject(:+)
  end

  def self.to_digits(output_base, number)
    digits = []

    until number.zero?
      digits.unshift(number % output_base)
      number /= output_base
    end

    digits.empty? ? [0] : digits
  end
end

class BookKeeping
  VERSION = 2
end
