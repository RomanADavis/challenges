class Queens
  def initialize(positions)
    self.board = Array.new(8) {Array.new(8) {'_'}}
    self.positions = positions
    set_queens
  end

  def set_queens
    positions.each_key do |queen|
      coordinates = positions[queen]
      raise ArgumentError unless valid?(coordinates)
      char = 'W' if queen == :white
      char = 'B' if queen == :black
      self.board[coordinates.first][coordinates.last] = char
    end
  end

  def valid?(coordinates)
    coordinates.none? {|dimension| dimension > 7 || dimension < 0}
  end
end
