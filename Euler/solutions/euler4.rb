# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

class Integer
  def palindrome?
    self.to_s == self.to_s.reverse
  end
end

palindromes = []

(100..999).each do |x|
  (100..999).each {|y| palindromes << x * y if (x * y).palindrome?}
end

p palindromes.max
