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
end

max = 0

(1..100).each do |a|
  (1..100).each do |b|
    sum = (a**b).digits.inject(:+)
    max = sum if sum > max
  end
end

p max
