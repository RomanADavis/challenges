class Alphametics
  DIGITS = (0..9).to_a
  def self.solve(puzzle_string)
    @puzzle = puzzle_string
    @letters = puzzle_string.scan(/[A-Z]/).uniq
    @solutions = DIGITS.combination(@letters.length).to_a
                .map {|combo| combo.permutation}
    try_solutions
  end

  private
    def self.try_solutions
      @solutions.each do |combo|
        combo.each do |permutation|
          solution = attempt(permutation.to_a)
          return solution if solved?(solution)
        end
      end
    end

    def self.attempt(numbers)
      result = {}
      @letters.zip(numbers) {|letter, number| result[letter] = number}
      result
    end

    def self.solved?(attempt)
      fillin = @puzzle.chars.map {|char| attempt.fetch(char, char)}.join
      return false if fillin.scan(/\d+/).any? {|n| n[0] == "0"}
      eval(fillin)
    end
end
