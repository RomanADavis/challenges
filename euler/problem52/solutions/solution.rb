class Integer
  def digits
    n = self
    digits = []

    until n == 0
      digits << n % 10
      n /= 10
    end

    digits.reverse
  end

  def permutation
    digits.permutation
  end

  def permutation_of?(other)
    digits.sort == other.digits.sort
  end
end

i = 10

loop do
  i += 1
  break if (i * 2).permutation_of?(i)
end

p i

loop do
  i += 1
  break if (1..6).map {|n| (i * n).permutation_of?(i)}.all?
end

p i
