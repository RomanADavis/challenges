class Say
  ONES = {1 => "one", 2 => "two", 3 => "three", 4 => "four",
          5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine",
          10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen",
          14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen",
          18 => "eighteen", 19 => "nineteen"}
  TENS = {0 => "", 1 => "", 2 => "twenty", 3 => "thirty", 4 => "forty",
          5 => "fifty", 6 => "sixty", 7 => "seventy", 8 => "eighty",
          9 => "ninety"}

  MILLION = 1e6.to_i
  BILLION = 1e9.to_i
  TRILLION = 1e12.to_i

  def initialize(n)
    @value = n
  end

  def in_english
    raise ArgumentError unless (0...TRILLION).include? @value
    return "zero" if @value.zero?
    billions(@value).strip
  end

  private
    def last_two(value)
      return ONES[value] if value < 20
      "#{TENS[value / 10]}#{ONES[value % 10] ? "-#{ONES[value % 10]}" : ""}"
    end

    def last_three(value)
      return last_two(value) if value < 100
      "#{ONES[value / 100]} hundred #{last_two(value % 100)}"
    end

    def thousands(value)
      return last_three(value) if value < 1000
      "#{last_three(value / 1000)} thousand #{last_three(value % 1000)}"
    end

    def millions(value)
      return thousands(value) if value < MILLION
      "#{last_three(value / MILLION)} million #{thousands(value % MILLION)}"
    end

    def billions(value)
      return millions(value) if value < BILLION
      "#{last_three(value / BILLION)} billion #{millions(value % BILLION)}"
    end
end

module BookKeeping
  VERSION = 1
end
