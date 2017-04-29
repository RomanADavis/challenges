class Luhn
  def self.valid?(credit_string)
    digits = credit_string.delete(' ')
    return false if digits.match(/\d+/).to_s != digits
    return false if digits.length < 2

    digits = digits.chars.map {|char| char.to_i}

    # Get every other digit from the right.
    doubled = digits.reverse.each_slice(2).map(&:last).select {|n| n}
    doubled.map! {|n| n * 2}
    doubled.map! {|n| n > 9 ? n - 9 : n}

    singles = digits.reverse.each_slice(2).map(&:first) # Get the other digits

    total = singles.inject(:+) + doubled.inject(:+)
    total % 10 == 0
  end
end

module BookKeeping
  VERSION = 1
end
