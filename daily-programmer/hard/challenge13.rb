# Create a rock-paper-scissors program, however, there should be no user input.
# the computer should play against itself. Make the program keep score, and for
# extra credit, give the option to "weigh" the chances, so one AI will one more
# often.

options = ["rock", "paper", "scissors"]
puts "Ash plays #{ash = options[rand(3)]}"
puts "Brock plays #{brock = rand > 0.7 ? "rock" : options[rand(3)]}"

current_score = File.open("score.txt", "rb").readlines.map(&:split)

case [ash, brock]
when ["paper", "rock"], ["rock", "scissors"], ["scissors", "paper"]
  puts "Ash wins!"
  current_score[0][1] = (current_score[0][1].to_i + 1).to_s
when ["paper", "paper"], ["rock", "rock"], ["scissors", "scissors"]
  puts "Draw!"
when ["paper", "scissors"], ["rock", "paper"], ["scissors", "rock"]
  puts "Brock wins!"
  current_score[1][1] = (current_score[1][1].to_i + 1).to_s
else
  puts "Programmer fail."
  current_score[2][1] = (current_score[2][1].to_i - 1).to_s
end

current_score = current_score.map {|tally| tally.join(" ")}.join("\n")
puts current_score

File.write("score.txt", current_score)
