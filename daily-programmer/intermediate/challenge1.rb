#create a program that will allow you to enter events organizable by hour. There
#must be menu options of some form, and you must be able to easily edit, add,
#and delete events without directly changing the source code.

#(note that by menu i dont necessarily mean gui. as long as you can easily
#access the different options and receive prompts and instructions telling you
#how to use the program, it will probably be fine)

class Menu
  def self.show
    puts "\nWhat's your name?"
    new($stdin.gets.chomp).start
  end

  def initialize(user)
    @user = user
    @schedule = Schedule.new
  end

  def start
    puts "Hello. Welcome to simple scheduler 0.0.0."
    puts "You should be able to shedule events using this program."

    loop do
      key
      crud
    end
  end

  def help
  end

  def key
    puts "Press C to add an event and time to the schedule."
    puts "Press R to view the schedule."
    puts "Press U to edit the schedule."
    puts "Press D to remove an item from the schedule."
    puts "Press X to exit."
  end

  def crud
    case input[0].upcase
    when "C" then create
    when "R" then read
    when "U" then update
    when "D" then delete
    when "X" then exit(0)
    end
  end

  def input
    print "[#{@user}]>"
    $stdin.gets.chomp
  end

  def create
    puts "What event would you like to schedule?"
    event = input
    puts "What time is the event?"
    time = input
    @schedule.create(time, event)
  end

  def read
    puts "Time|\t\t\tEvent"
    @schedule.read.each_pair do |time, event|
      puts "#{time}\t\t\t #{event}"
    end
  end

  def update
    puts "What time would you like to change?"
    time = input
    puts "What event would you like to schedule for that time instead?"
    event = input
    @schedule.update(time, event)
  end

  def delete
    puts "What time would you like to take off your schedule?"
    time = input
    @schedule.delete(time)
  end
end

class Schedule
  def initialize
    @schedule = {} #Time => event
  end

  def create(time, event)
    @schedule[time] = event
  end

  def read
    @schedule
  end

  def update(time, event)
    @schedule[time] = event
  end

  def delete(time)
    @schedule.delete(time)
  end
end

Menu.show
