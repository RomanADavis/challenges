class Board
  def self.transform(board)
    validate(board)
    @cells = board.map(&:chars)

    @cells.map!.with_index do |row, y|
      row.map.with_index do |cell, x|
        bomb_count = neighbor_count(x, y)
        cell == ' ' && bomb_count > 0 ? bomb_count : cell
      end
    end

    @cells.map(&:join).each {|row| puts row}
  end

  private # Again, there's got to be a better way to do this. :/
  NEIGHBORS = {north:     ->(x, y){@cells[y - 1][x]},
               northeast: ->(x, y){@cells[y - 1][x + 1]},
               east:      ->(x, y){@cells[y]    [x + 1]},
               southeast: ->(x, y){@cells[y + 1][x + 1] if @cells[y + 1]},
               south:     ->(x, y){@cells[y + 1][x]     if @cells[y + 1]},
               southwest: ->(x, y){@cells[y + 1][x - 1] if @cells[y + 1]},
               west:      ->(x, y){@cells[y]    [x - 1]},
               northwest: ->(x, y){@cells[y - 1][x - 1]}
             }

  def self.neighbor_count(x, y)
    neighbors = NEIGHBORS.each_value.map {|find_neighbor| find_neighbor[x, y]}
    neighbors.count {|neighbor| neighbor == '*'}
  end

  def self.validate(board)
    raise ValueError, "No jagged arrays." if jagged_array?(board)
    raise ValueError, "Fauty border." if faulty_border?(board)
    raise ValueError, "Invalid char." if invalid_char?(board)
  end

  def self.jagged_array?(board)
    board.any? {|row| row.length != board.first.length}
  end

  def self.faulty_border?(board)
    board[1...-1].any? {|row| row[0] != '|' || row[-1] != '|'}
  end

  def self.invalid_char?(board)
    valid_chars = "+-| *"

    board.any? do |row|
      row.chars.any? {|char| !valid_chars.include?(char)}
    end
  end
end

class ValueError < StandardError
end
