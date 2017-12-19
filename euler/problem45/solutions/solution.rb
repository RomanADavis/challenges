class Integer
  def triangle?
    ((((8  * self) + 1)**0.5 - 1) / 2.0) % 1 == 0
  end

  def pentagonal?
    ((((24 * self) + 1)**0.5 + 1) / 6.0) % 1 == 0
  end

  def hexagonal?
    ((((8  * self) + 1)**0.5 - 1) / 4.0) % 1 == 0
  end
end

class Hexagon
  def self.new(n)
    n * (2 * n - 1)
  end
end

h = 144
h += 1 until Hexagon.new(h).pentagonal? && Hexagon.new(h).triangle?

p Hexagon.new(h)
