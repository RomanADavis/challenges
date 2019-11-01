class Integer
  def digits
    n = self
    digits = []

    until n == 0
      digits << n % 10
      n /= 10
    end

    digits
  end
end


count = (1...10_000_000).inject(0) do |total, n|
  until n == 1 || n == 89
    n = n.digits.map {|digit| digit*digit}.inject(:+)
  end
  n == 89 ? total + 1 : total
end

p count
