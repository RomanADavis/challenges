class WordProblem
  WORD_TO_SYMBOL = {"plus" => '+', "minus" => '-', "multiplied" => '*',
                    "divided" => '/', "by" => ""}
  def initialize(question)
    words = question[0...-1].split[2..-1]

    @equation = words.map do |word|
      raise ArgumentError unless word == word.to_i.to_s || WORD_TO_SYMBOL[word]
      WORD_TO_SYMBOL.fetch(word, word)
    end

    @equation = @equation.reject {|symbol| symbol.empty?}
  end

  def answer # Should I have written my own little interpreter?
    equation = @equation

    running_total = eval(equation[0..2].join(' '))
    equation = equation[3..-1]

    until equation.nil? || equation.empty?
      running_total = eval(running_total.to_s + equation[0..1].join(' '))
      equation = equation[2..-1]
    end

    running_total
  end
end

module BookKeeping
  VERSION = 1
end
