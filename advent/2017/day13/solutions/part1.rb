class Layer
  attr_accessor :depth, :range, :scanner_position, :orientation
  def initialize(depth, range)
    self.depth = depth
    self.range = range
    self.scanner_position = 1
    self.orientation = :forward
  end

  def tick
    if self.orientation == :forward
      self.scanner_position += 1
      self.orientation = :backward unless self.scanner_position == self.range
    else
      self.scanner_position -= 1
      self.orientation = :forward unless self.scanner_position == 1
    end
  end
end

class Firewall
  attr_accessor :layers, :firewall

  def initialize(filename)
    self.layers = parse(File.readlines(filename))
    self.firewall = construct
  end

  def parse(lines)
    lines.map do |line|
      Layer.new(line.split[0].chop.to_i, line.split[1].to_i)
    end
  end

  def construct
    # Set the parameters of the grid
    firewall = Array.new(self.layers.max_by(&:depth).depth + 1) do
      Array.new(self.layers.max_by(&:range).range + 1) {"   "}
    end

    # Draw the wall
    firewall.each_with_index do |line, index|
      line[0] = " #{index} "
      line[1] = "..."
    end# No wall hereo
    self.layers.each do |layer|
      firewall[layer.depth][1] = "[S]" # Place the scanner
      firewall[layer.depth][2..layer.range].each_with_index do |_, i|
        firewall[layer.depth][i + 2] = "[ ]"
      end
    end

    # Set the wall upright for easier drawing.
    firewall.transpose
  end

  def draw
    firewall.each do
      |line| line.each {|cell| print cell, ' '}
      puts "\n"
    end
  end

  def tick

  end
end

Firewall.new("../input/sample.txt").draw
