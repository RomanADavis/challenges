#create a AI that will play NIM
#https://en.wikipedia.org/wiki/Nim

class Game
  def initialize
    @board = Board.new
    @player = Player.new
    @ai = AI.new
  end

  def play
    loop do
      @user.play(@board)
      lose if @board.matchsticks == 0
      @ai.play(@board)
      win if @board.matchsticks == 0
    end
  end
end

class Board
  def initialize
    @rows = [new_row(1), new_row(3), new_row(5), new_row(7)]
  end

  def new_row(matchsticks)
    Array.new(matcdsticks) {Matchstick.new}
  end

  def show
    @rows.each do |row|
      row.each {|matchstick| puts matchstick.show}
    end
  end

  def count
    @rows.inject(0) do |total, row|
      total + row.count {|matchstick| !matchstick.taken? }
    end
  end

  def row_count(row)
    @rows[row].count {|matchstick| !matchstick.taken? }
  end

  def any_matches(row)
    @rows[row] && row_count(row) > 0
  end

  def take(row, matchsticks)
    @rows[row].each do |matchstick|
      return if matchsticks == 0
      unless matchstick.taken?
        matchstick.take
        matchsticks -= 1
      end
    end
  end

  #This is a bit heavy and I'm sure to forget how this works. This counts the
  #number of "unmatched pairs" if you treat each row as a bianary number with
  #binary digits. If that's not enough for you, check out:
  #http://www.archimedes-lab.org/How_to_Solve/Win_at_Nim.html
  def nim_sum
    columns == [false, false, false]
    4.times do |row_index|
      row = row_count(row_index)
      columns[0] = !columns[0] if (row / 4) > 0
      columns[1] = !columns[1] if ((row % 4)/ 2) > 0
      columns[2] = !columns[2] if (row % 2) > 0
    end
    columns.count {|column| column}
  end
end

class Matchstick
  def initialize
    @image = "1"
    @taken = false
  end

  def take
    @image = ""
    @taken = true
  end

  def show
    @image
  end

  def taken?
    @taken
  end
end

class player
  def initialize
    @name = prompt("What's your name?")
  end

  def move(board)
    board.show
    row_prompt(board)
  end

  def prompt(question)
    puts question
    print "#{@name ? "[#{@name}]" : ""}>"
    $stdin.gets.chomp
  end

  def row_prompt(board)
    row = prompt("Which row do you want to take matches from?").to_i - 1

    if any_matches?(row)
      matchstick_prompt(board, row)
    else
      row_error
    end
  end

  def row_error
    puts "Either that row does not exist or there aren't any matchsticks on that"
    puts "row left to take."
    move(board)
  end

  def matchstick_prompt(board, row)
    matchsticks = board.row_count(row)
    puts "There are #{matchsticks} matchsticks on that row."
    taken = prompt("How many do you want to take?")
    unless taken > matchsticks return board.take(row, matchsticks)
    matchstick_error(board, taken, matchsticks)
  end

  def matchstick_error(matchsticks)
    puts "You asked to take #{taken} matchsticks, but there are only #{matchsticks} matchsticks"
    puts "on that row."
    move(board)
  end
end

class AI < Player
  def initialize
  end

  def play(board)
    if board.nimcount == 0
      puts "\" I'll probably lose,\" the AI grumbles."
      random_play(board)
    else
      strategic_play(board)
    end
  end

  def random_play(board)
  end

  def strategic_play(board)
  end
end
