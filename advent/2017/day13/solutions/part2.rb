require_relative "part1"

class Firewall
  attr_accessor :positions, :picoseconds
  def initialize(filename)
    self.filename = filename
    self.layers = parse(File.readlines(filename))
    self.grid = grid
    self.positions = [0]
    self.picoseconds = 0
  end

  def image
    board = walls
    self.positions.each do |position|
      board[1][position][0] = '('
      board[1][position][2] = ')'
    end
    board
  end

  def catch
    self.positions.reject! do |position|
      self.layers.any? do |layer|
        layer.depth == position && layer.scanner_position == 1
      end
    end
  end

  def update
    catch
    wait
    self.positions.map! {|position| position + 1}
    self.positions.unshift(0)
    self.picoseconds += 1
  end

  def run # Way too slow. Takes like 5 hours.
    until self.positions.any? {|pos| pos >= self.grid.length}
      # draw
      # gets
      update
    end
    self.picoseconds - self.grid.length
  end
end

p Firewall.new("../input/sample.txt").run
p Firewall.new("../input/firewall.txt").run
