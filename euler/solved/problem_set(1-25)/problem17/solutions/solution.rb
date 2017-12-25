class Integer
  def to_words
    output, n = "", self

    output += thousands
    output += hundreds
    output += tens
    output +  ones
  end

  def thousands
    ones  = ["one", "two", "three", "four", "five", "six", "seven", "eight",
            "nine"]

    thousands = self / 1000

    if thousands > 0
      return "#{ones[thousands - 1]} thousand"
    end

    ""
  end

  def hundreds
    ones  = ["one", "two", "three", "four", "five", "six", "seven", "eight",
            "nine"]

    hundreds = (self % 1000) / 100

    if hundreds > 0
      return "#{ones[hundreds - 1]} hundred"
    end

    ""
  end

  def tens
    tens =  ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty",
            "ninety"]

    ten = (self % 100) / 10
    needs_and = (self / 100) > 0

    if ten > 1
      return "#{needs_and ? " and " : ""}#{tens[ten - 2]}"
    end

    ""
  end

  def ones
    ones  = ["one", "two", "three", "four", "five", "six", "seven", "eight",
            "nine", "ten", "eleven", "twelve", "thirteen", "fourteen",
            "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

    hundreds = self / 100
    tens = (self % 100) / 10
    needs_and = tens < 2 && hundreds > 0

    if tens == 1
      return "#{needs_and ? " and " : ""}#{ones[(self % 20) - 1]}"
    elsif self % 10 > 0
      return "#{needs_and ? " and " : ""}#{tens > 0 ? " " : ""}#{ones[(self % 10) - 1]}"
    end

    ""
  end
end


p (1..1000).inject("") {|t, n| t + n.to_words}.chars.count {|c| c != ' '}
