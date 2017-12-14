require_relative "part1"

class Firewall
  def caught?
    if layer = self.layers.find {|layer| layer.depth == self.position}
      layer.scanner_position == 1
    else
      false
    end
  end

  def run
    picoseconds = 0
    loop do
      while self.position < grid.length
        if caught?
          reset
          wait(picoseconds += 1)
          break
        end

        # draw
        # gets
        update
      end
      return picoseconds if self.position == grid.length
    end
  end
end

p Firewall.new("../input/sample.txt").run
p Firewall.new("../input/firewall.txt").run
