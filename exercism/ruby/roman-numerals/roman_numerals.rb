class Integer
  def to_roman
    symbols = {1 => 'I', 5 => 'V', 10 => 'X', 50 => 'L', 100 => 'C', 500 => 'D',
      1000 => 'M'}
    tenths = [1, 10, 100]
    result = ""
    remainder = self
    symbols.keys.reverse.each_with_index do |key, index|
      last =  symbols.keys.reverse[index - 1]
      tenths.each do |tenth|
        if last > tenth && remainder >= last - tenth
          remainder -= symbols.keys.reverse[index - 1] - tenth
          result += symbols[tenth] + symbols[last]
        end
      end
      if remainder >= key
        result += symbols[key] * (remainder / key)
        remainder %= key
      end
    end
    result
  end
end

module BookKeeping
  VERSION = 2
end
