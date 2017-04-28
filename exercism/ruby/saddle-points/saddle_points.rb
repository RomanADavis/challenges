class Matrix
  attr_accessor :string
  def initialize(string)
    self.string = string
  end

  def rows
    return @rows if @rows

    rows = string.split("\n")
    rows.map {|row| row.split.map(&:to_i)}
  end

  def columns
    return @columns if @columns

    length = rows.first.length

    @columns = (0...length).map do |index|
      rows.map {|row| row[index]}
    end
  end

  def saddle_points
    return @saddle if @saddle
    highest = []

    # Get the index of each part of the matrix with the highest value in row
    rows.each_with_index do |row, y|
      row.each_with_index do |val, x|
        highest << [y, x] if row.max == val
      end
    end

    # Select from the highest that are also the lowest in their column
    @saddle = highest.select do |high|
      y = high.first
      x = high.last
      rows[y][x] == columns[x].min
    end
  end
end
