lights = Array.new(1000) {Array.new(1000) {false}}
class Array
  def parse(instruction)
    instruction = instruction.chomp.split
    top_corner = instruction[-3].split(",").map(&:to_i)
    bottom_corner = instruction[-1].split(",").map(&:to_i)
    self[top_corner[0]..bottom_corner[0]].each do |column|
      column[top_corner[1]..bottom_corner[1]].map! do |light|
        statm = case instruction[1]
        when "on" then true
        when "off" then false
        else !light
        end
      end
    end
  end
end

instructions = File.readlines("./input/day6.txt").map {|order| order.chomp}
instructions.each {|instruction| lights.parse(instruction)}
p lights
p lights.inject(0) { |total, row| total + row.count(true) }
