class Matrix
  attr_accessor :rows, :columns
  def initialize(string)
    rows = string.split("\n")
    self.rows = rows.map {|row| row.split.map(&:to_i)}

    self.columns = (0...rows.length).map do |index|
      self.rows.map {|row| row[index]}
    end
  end
end
