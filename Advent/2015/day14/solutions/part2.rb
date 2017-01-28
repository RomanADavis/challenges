# --- Part Two ---
#
# Seeing how reindeer move in bursts, Santa decides he's not pleased with the
# old scoring system.
#
# Instead, at the end of each second, he awards one point to the reindeer
# currently in the lead. (If there are multiple reindeer tied for the lead, they
# each get one point.) He keeps the traditional 2503 second time limit, of
# course, as doing otherwise would be entirely ridiculous.
#
# Given the example reindeer from above, after the first second, Dancer is in
# the lead and gets one point. He stays in the lead until several seconds into
# Comet's second burst: after the 140th second, Comet pulls into the lead and
# gets his first point. Of course, since Dancer had been in the lead for the 139
# seconds before that, he has accumulated 139 points by the 140th second.
#
# After the 1000th second, Dancer has accumulated 689 points, while poor Comet,
# our old champion, only has 312. So, with the new scoring system, Dancer would
# win (if the race ended at 1000 seconds).
#
# Again given the descriptions of each reindeer (in your puzzle input), after
# exactly 2503 seconds, how many points does the winning reindeer have?


class Reindeer
  attr_accessor :name, :speed, :fly_time, :fly_time_left, :rest_time,
                :rest_time_left, :distance, :points
  def initialize(description)
    description = description.split
    self.name = description[0]
    self.speed = description[3].to_i
    self.fly_time = self.fly_time_left = description[6].to_i
    self.rest_time, self.rest_time_left = description[-2].to_i, 0
    self.distance = self.points = 0
  end

  def go
    self.fly_time_left.zero? ? rest : fly
  end

  def fly
    self.fly_time_left -= 1
    self.distance += self.speed
    self.rest_time_left = self.rest_time if self.fly_time_left.zero?
  end

  def rest
    self.rest_time_left -= 1
    self.fly_time_left = self.fly_time if self.rest_time_left.zero?
  end
end

contestants = File.readlines("./input/reindeer.txt")

contestants.map! { |reindeer| Reindeer.new(reindeer) }

seconds = 2503


seconds.times do
  contestants.each {|reindeer| reindeer.go }
  contestants.max_by {|reindeer| reindeer.distance}.points += 1
end

puts contestants.max_by {|reindeer| reindeer.points }.points
