class Game
  attr_accessor :player1hand, :player2hand
  def initialize(line)
    self.player1hand = Hand.new(line.split[0..4])
    self.player2hand = Hand.new(line.split[5..-1])
  end

  def player1_win?
    self.player1hand.win_against?(self.player2hand)
  end

  def player2_win?
    self.player2hand.win_against?(self.player1hand)
  end

  def outcome
    if player1_win?
      puts "Winner: Player 1"
    else
      puts "Winner: Player 2"
    end
  end
end
