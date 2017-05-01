class Robot
  attr_reader :bearing
  CARDINALS = [:north, :east, :south, :west]
  def initialize
  end

  def orient(bearing)
    raise ArgumentError unless CARDINALS.include? bearing
    @bearing = bearing
  end
end
