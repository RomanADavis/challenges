def dual_palindrome?(n)
  n.to_s == n.to_s.reverse && n.to_s(2) == n.to_s(2).reverse
end

def dual_palindromes_under(n)
  (1...n).select {|candidate| dual_palindrome?(candidate)}
end

p dual_palindrome?(585)
p dual_palindromes_under(1_000_000).inject(:+)
