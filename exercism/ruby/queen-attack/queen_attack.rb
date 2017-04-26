class Queens
  attr_accessor :positions
  def initialize(positions)
    positions.each_value {|coords| raise ArgumentError unless on_board?(coords)}
    self.positions = positions
  end

  def on_board?(coordinates)
    coordinates.none? {|dimension| dimension > 7 || dimension < 0}
  end

  def attack?
    return false if self.positions.keys.length < 2
    return true if horizontal_attack?
    return true if vertical_attack?
    diagonal_attack?
  end

  def vertical_attack?
    y_coords = self.positions.each_value.map {|coords| coords.first}
    y_coords.first == y_coords.last
  end

  def horizontal_attack?
    x_coords = self.positions.each_value.map {|coords| coords.first}
    x_coords.first == x_coords.last

  end

  def diagonal_attack?
    x_distance = (self.positions[:white][0] - self.positions[:black][0]).abs
    y_distance = (self.positions[:white][1] - self.positions[:black][0]).abs
    x_distance == y_distance
  end
end

module BookKeeping
  VERSION = 2
end
