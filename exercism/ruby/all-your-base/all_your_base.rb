class BaseConverter
  def self.convert(input_base, digits, output_base)
    number = self.to_i(input_base, digits)

    self.to_digits(output_base, number)
  end

  def self.to_i(input_base, digits)
    terms = digits.reverse.map.with_index do |digit, place|
      digit * input_base**place
    end

    terms.inject(:+)
  end

  def self.to_digits(output_base, number)
    digits = []
    place = 0

    until number.zero?
      digits.unshift(number / output_base**place)
      number %= output_base**place
      place += 1
      p digits, number
      gets
    end

    digits
  end
end

p BaseConverter.to_digits(10, 10)
