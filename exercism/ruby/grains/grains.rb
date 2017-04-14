class Grains
  def self.square(n)
    raise ArgumentError unless (1..64).include? n
    2 ** (n - 1)
  end

  def self.total # Maybe just a little over golfed?
    (1..64).inject {|total, n| total + self.square(n)}
  end
end

module BookKeeping
  VERSION = 1
end
