class Firewall
  attr_accessor :layers, :firewall

  def initialize(filename)
    self.layers = parse(File.readlines(filename))
    self.firewall = construct
  end

  def parse(lines)
    lines.map {|line| [line.split[0].chop.to_i, line.split[1].to_i] }.to_h
  end

  def construct
    # Set the parameters of the grid
    firewall = Array.new(self.layers.keys.max + 1) do
      Array.new(self.layers.values.max + 1) {"   "}
    end

    # Draw the wall
    firewall.each_with_index do |line, index|
      if self.layers[index]
        line[1] = "[S]" # Place the scanner
        line[2..self.layers[index]].each_with_index {|_,i| line[i + 2] = "[ ]"}
      else
        line[1] = "..." # No wall here
      end
    end

    # Label the wall layers
    firewall.each_with_index {|line, index| line[0] = " #{index} "}

    # Set the wall upright for easier drawing.
    firewall.transpose
  end

  def draw
    firewall.each do
      |line| line.each {|cell| print cell, ' '}
      puts "\n"
    end
  end
end

Firewall.new("../input/sample.txt").draw
