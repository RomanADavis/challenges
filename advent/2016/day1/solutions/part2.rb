require_relative "./day1part1.rb"
instructions = File.read("./input/day1.txt").chomp.split(", ")
cardinal = :North
position = [0, 0]
locations = [position]

instructions.each do |instruction|
  cardinal = turn(cardinal, instruction[0])
  instruction[1..-1].to_i.times do
    position = case cardinal
                when :north then [position.first, position.last + 1]
                when :east then [position.first + 1, position.last]
                when :south then [position.first, position.last - 1]
                else [position.first - 1, position.last]
                end
    break if locations.include? position
    locations << position
  end
end

p position.first.abs + position.last.abs
