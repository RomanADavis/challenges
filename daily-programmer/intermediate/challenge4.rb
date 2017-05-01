#create a calculator program that will take an input, following normal
#calculator input (5*5+4) and give an answer (29). This calculator should use
#all four operators.
#For extra credit, add other operators (6(4+3), 3 ** 3, etc.)

#It's pretty easy to cheese this one with eval. Let's see if I can make a little
#parser

#Not finished

class String
  def number?
    self.to_i.to_s == self
  end
end

class calculator
  def run
    loop do
      calculate(parse($stdin.gets.chom))
    end
  end

  def tokenize(equation)
    tokens = []
    token = ""
    equation.chars do |char|
      next token += char if token.number? == char.number?
      tokens << token
      token = char
    end
  end

  def categorize()

  def parse(equation)
    equation = tokenize(equation)
    equation = validate(equation)
    categorize(equation)
  end

  def calculate
  end
end
