class Robot
  attr_reader :bearing, :coordinates
  CARDINALS = [:north, :east, :south, :west]
  def at(*coordinates)
    @coordinates = coordinates
  end

  def orient(bearing)
    raise ArgumentError unless CARDINALS.include? bearing
    @bearing = bearing
  end

  def advance
    case @bearing
    when :north then coordinates[1] += 1
    when :east  then coordinates[0] += 1
    when :south then coordinates[1] -= 1
    when :west  then coordinates[0] -= 1
    end
  end

  def turn_right
    bearing = CARDINALS[CARDINALS.find_index(self.bearing) + 1]
    @bearing = bearing ? bearing : CARDINALS.first
  end

  def turn_left
    @bearing = CARDINALS[CARDINALS.find_index(self.bearing) - 1]
  end
end
