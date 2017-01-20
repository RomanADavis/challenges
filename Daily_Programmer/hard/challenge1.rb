#we all know the classic "guessing game" with higher or lower prompts. lets do a
#role reversal; you create a program that will guess numbers between 1-100, and
#respond appropriately based on whether users say that the number is too high or
#too low. Try to make a program that can guess your number based on user input
#and great code!

class GuessGame
  def initialize
    @ceiling = 100
    @floor = 0
    @guesses = 0
  end

  def start
    intro
    guess
  end

  def intro
    puts "This is a little guessing game. Pick a number between 1 and 100 and"
    puts "I'll try to guess."
  end

  def current_guess
    (@ceiling + @floor) / 2
  end

  def guess
    @guesses += 1
    puts "Is it #{current_guess}? Y/n"
    check
  end

  def check
    case $stdin.gets.chomp
    when "y" then victory_dance
    when "n" then question
    else guess
    end
  end

  def question
    puts "Was it higher or lower?"
    answer
    guess
  end

  def answer
    case $stdin.gets.chomp
    when "h" then go_high
    when "l" then go_low
    else question
    end
  end

  def go_high
    @floor = current_guess
  end

  def go_low
    @ceiling = current_guess
  end

  def victory_dance
    puts "Yay! I got it right!"
    puts "And it only took me #{@guesses} guesses."
    puts "Bye!"
    exit(0)
  end
end

GuessGame.new.start
