class Integer
  def factorial
    return 1 if self < 2
    (1..self).inject(:*)
  end

  def digit_factorial?
    self == self.to_s.chars.map {|digit| digit.to_i.factorial}.inject(:+)
  end
end

# I thought this would be easy, but it's actually really slow
cap = 9.factorial * 10 # Not even 4 million
# Only two numbers, largest is 40,585
cap = 50_000
digit_factorials = []
(10..cap).each do |n|
  digit_factorials << n if n.digit_factorial?
end

p digit_factorials.inject(:+)
