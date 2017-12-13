class Layer
  attr_accessor :depth, :range, :scanner_position, :orientation
  def initialize(depth, range)
    self.depth = depth
    self.range = range
    self.scanner_position = 1
    self.orientation = :forward
  end

  def update
    if self.orientation == :forward
      self.scanner_position += 1
      self.orientation = :backward unless self.scanner_position < self.range
    else
      self.scanner_position -= 1
      self.orientation = :forward unless self.scanner_position > 1
    end
  end

  def image
    wall = Array.new(self.range + 1) {"[ ]"}
    wall[0] = " #{self.depth} "
    wall[self.scanner_position] = "[S]"
    wall
  end
end

class Firewall
  attr_accessor :layers

  def initialize(filename)
    self.layers = parse(File.readlines(filename))
  end

  def parse(lines)
    lines.map do |line|
      Layer.new(line.split[0].chop.to_i, line.split[1].to_i)
    end
  end

  def image
    # Set the parameters of the grid
    firewall = Array.new(self.layers.max_by(&:depth).depth + 1) do
      Array.new(self.layers.max_by(&:range).range + 1) {"   "}
    end

    # Label layers and draw gaps
    firewall.each_with_index do |line, index|
      line[0] = " #{index} "
      line[1] = "..."
    end#

    # Draw walls
    self.layers.each do |layer|
      layer.image.each_with_index do |cell, index|
        firewall[layer.depth][index] = cell
      end
    end

    # Set the wall upright for easier drawing.
    firewall.transpose
  end

  def draw
    image.each do
      |line| line.each {|cell| print cell, ' '}
      puts "\n"
    end
  end

  def update
    self.layers.each {|layer| layer.update}
  end

  def tick
    draw
    gets
    update
  end

  def run
    loop do
      tick
    end
  end
end

Firewall.new("../input/sample.txt").run
