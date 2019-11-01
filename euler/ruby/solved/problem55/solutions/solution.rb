class Integer
  def palindrome?
    self == self.to_s.reverse.to_i
  end

  def lychrel?
    n = self

    50.times do
      n = n.to_s.reverse.to_i + n
      return false if n.palindrome?
    end

    true
  end
end


p 10_000.times.count {|n| n.lychrel?}
