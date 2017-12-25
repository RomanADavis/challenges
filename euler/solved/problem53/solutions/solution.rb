class Integer
  def factorial # Works for positive values of self only!
    return 1 if self < 2
    (1..self).inject(:*)
  end

  def choose(other)
    self.factorial / (other.factorial * (self - other).factorial)
  end
end

count = 0

(1..100).each do |n|
  (0..n).each do |r|
    count += 1 if n.choose(r) > 1_000_000
  end
end

p count
