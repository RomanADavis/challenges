class Matrix
  attr_accessor :rows
  def initialize(filename)
    self.rows = File.readlines(filename).map {|row| row.split(',').map(&:to_i)}
  end

  def smallest_sum
    rows = self.rows.each.with_index do |row, y|
      row.each.with_index do |cell, x|
        next if x == 0 && y == 0
        options = []
        options << self.rows[y - 1][x] unless y == 0
        options << self.rows[y][x - 1] unless x == 0
        self.rows[y][x] = cell + options.min
      end
    end

    rows[-1][-1]
  end
end

p Matrix.new("../input/sample.txt").smallest_sum
p Matrix.new("../input/matrix.txt").smallest_sum
