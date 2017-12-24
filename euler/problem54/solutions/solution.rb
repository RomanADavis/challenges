require_relative "card.rb"
require_relative "hand.rb"
require_relative "game.rb"

Game.new("5H 5C 6S 7S KD 2C 3S 8S 8D TD").outcome #Player 2
Game.new("5D 8C 9S JS AC 2C 5C 7D 8S QH").outcome #Player 1
Game.new("2D 9C AS AH AC 3D 6D 7D TD QD").outcome #Player 2
Game.new("4D 6S 9H QH QC 3D 6D 7H QD QS").outcome #Player 1
Game.new("2H 2D 4C 4D 4S 3C 3D 3S 9S 9D").outcome #Player 1
p Hand.new("2D 3H 4C 5D 6D".split).straight?
solution = File.readlines("../input/input.txt").count do |line|
  Game.new(line).player1_win?
end

p solution
