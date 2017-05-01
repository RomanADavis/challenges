class Simulator
  CHAR_TO_INSTRUCTION = {'L' => :turn_left, 'R' => :turn_right, 'A' => :advance}
  # Why aren't these just class methods?
  def instructions(string)
    string.chars.map {|char| CHAR_TO_INSTRUCTION[char]}
  end

  def place(robot, **options)
    robot.at(options[:x], options[:y])
    robot.orient(options[:direction])
  end

  def evaluate(robot, string)
    instructions(string).each {|instruction| robot.send(instruction)}
  end
end

class Robot
  CARDINALS = [:north, :east, :south, :west]

  attr_reader :bearing, :coordinates

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
