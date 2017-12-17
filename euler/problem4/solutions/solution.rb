require "set"

def palindrome?(n)
  n = n.to_s
  n == n.reverse
end

def products_for(digits)
  cap   = 1 * 10 ** digits
  floor = 1 * 10 ** (digits - 1)
  multiples = Set.new

  (floor...cap).each do |first|
    (floor...cap).each {|second| multiples << first * second}
  end

  multiples
end

def palindrome_products(digits)
  products_for(digits).select! {|multiple| palindrome?(multiple)}
end

def highest_palindrome_product_for(digits)
  palindrome_products(digits).max
end

p highest_palindrome_product_for(digits = 2)
p highest_palindrome_product_for(digits = 3)
