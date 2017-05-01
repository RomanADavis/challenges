#create a short text adventure that will call the user by their name. The text
#adventure should use standard text adventure commands ("l, n, s, e, i, etc.").

#for extra credit, make sure the program doesn't fault, quit, glitch, fail, or
#loop no matter what is put in, even empty text or spaces. These will be tested
#rigorously!

#For super extra credit, code it in C

##Not finished, and not in C.


glenn = Area.new("Shady Glenn",
"""
You find yourself in a shady in a woody area. It seems nice enough. You can hear
the sound of croaking and a river nearby.

You're getting hungry. Maybe if you found a weapon, and a way to make a fire,
you could get some frog legs for dinner.
""")


$MAP = {
  "START" =>
}
class Game
  def initialize
    intro
  end

  def prompt(question = "")
    puts "#{question}"
    print ">"
    $stdin.gets.chomp.downcase
  end

  def intro
    @user = Player.new(prompt("What's your name?"))
    game_loop
  end

  def game_loop
    loop do
      choice
    end
  end

  def choice
    case prompt(@user.look)[0]
    when "n" then @user.go("north")
    when "e" then @user.go("east")
    when "s" then @user.go("south")
    when "w" then @user.go("west")
    when "i" then @user.inventory.show
    when "l" then @user.look
    when "t" then prompt_take
    when "x" then prompt_examine
    else bore
    end
  end

  def prompt_take
    @user.take(prompt("Take what?"))
  end
end

class Area
  attr_reader :paths
  def initialize(name, description, paths ={})
    @name = name
    @discription = description
    @paths = paths
  end

  def add_paths(paths) #direction => area
    @paths.merge!(paths)
  end

  def appearance
    "\t\t\t\t#{name}\n#{description}"
  end
end

class Player
  def initialize(name, inventory = {})
    @name = name
    @inventory = {"snacks" => 1}
    @location = "start"
  end

  def look
    puts $MAP[@location].appearance
  end

  def go(direction)
    @location = @location.paths[direction]
  end

  def take(item)
    return @inventory << @location.items[item] if @location.items[item]
    puts "You can't take that."
  end

  def use(item)

  end
