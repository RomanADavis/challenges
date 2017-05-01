#Your mission is to create a stopwatch program. this program should have start,
#stop, and lap options, and it should write out to a file to be viewed later.

class StopWatch
  def initialize
    @lap = 0
    start
    game_loop
  end

  def game_loop
    loop do
      case $stdin.gets.chomp
      when "x"
        puts "\r"
        stop
      when "c"
        puts "\r"
        lap
      end
    end
  end

  def start
    @lap += 1
    @start = Time.now
  end

  def lap
    puts "#{@lap} : #{Time.now - @start}"
    start
  end

  def stop
    lap
    exit(0)
  end
end

puts "This is a simple stopwatch program. Press Z to start. Press X to stop"
puts "and exit the program. Press C to record to the time and start a new"
puts "lap."

StopWatch.new if $stdin.gets.chomp.downcase[0] == "z"
