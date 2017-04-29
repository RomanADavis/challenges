class OcrNumbers
  ZERO  = [" _ ",
           "| |",
           "|_|",
           "   "]
  ONE   = ["   ",
           "  |",
           "  |",
           "   "]
  TWO   = [" _ ",
           " _|",
           "|_ ",
           "   "]
  THREE = [" _ ",
           " _|",
           " _|",
           "   "]
  FOUR  = ["   ",
           "|_|",
           "  |",
           "   "]
  FIVE  = [" _ ",
           "|_ ",
           " _|",
           "   "]
  SIX   = [" _ ",
           "|_ ",
           "|_|",
           "   "]
  SEVEN = [" _ ",
           "  |",
           "  |",
           "   "]
  EIGHT = [" _ ",
           "|_|",
           "|_|",
           "   "]
  NINE  = [" _ ",
           "|_|",
           " _|",
           "   "]

  OCR_TO_VAL = {ZERO => '0', ONE => '1', TWO => '2', THREE => '3', FOUR => '4',
                FIVE => '5', SIX => '6', SEVEN => '7', EIGHT => '8',
                NINE => '9'}

  def self.convert(string)
    lines = string.split("\n")
    raise ArgumentError if lines.any? {|row| row.length % 3 != 0}
    raise ArgumentError if lines.length % 4 != 0

    numbers = lines.each_slice(4).to_a
    numbers.map {|number| make_number(number)}.join(',')
  end

  def self.make_number(set)
    grid = set.map {|row| row.scan(/.{3}/)}
    result = ""
    until grid.first.empty?
      digit = grid.inject([]) {|digit, row| digit << row.shift}
      result += OCR_TO_VAL.fetch(digit, '?')
    end
    result
  end
end

module BookKeeping
  VERSION = 1
end
