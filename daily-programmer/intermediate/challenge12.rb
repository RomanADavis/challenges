# Create a program that will factor a number. for example:
# 12 = 2 * 2 * 3
# 14 = 7 * 2
# 20 = 2 * 2 * 5
# thanks to bears_in_bowlers for todays challenge!

class Integer
  def factor
    number = self
    factors = []
    while number > 1
      iterator = 2
      iterator += 1 until number % iterator == 0
      factors << iterator
      number /= iterator
    end
    factors.map(&:to_i).join(" * ")
  end
end

puts ARGV.first.to_i.factor
