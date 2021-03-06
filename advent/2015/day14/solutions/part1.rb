# --- Day 14: Reindeer Olympics ---
#
# This year is the Reindeer Olympics! Reindeer can fly at high speeds, but must
# rest occasionally to recover their energy. Santa would like to know which of
# his reindeer is fastest, and so he has them race.
#
# Reindeer can only either be flying (always at their top speed) or resting (not
# moving at all), and always spend whole seconds in either state.
#
# For example, suppose you have the following Reindeer:
#
#     Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
#     Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
#
# After one second, Comet has gone 14 km, while Dancer has gone 16 km. After ten
# seconds, Comet has gone 140 km, while Dancer has gone 160 km. On the eleventh
# second, Comet begins resting (staying at 140 km), and Dancer continues on for
# a total distance of 176 km. On the 12th second, both reindeer are resting.
# They continue to rest until the 138th second, when Comet flies for another ten
# seconds. On the 174th second, Dancer flies for another 11 seconds.
#
# In this example, after the 1000th second, both reindeer are resting, and Comet
# is in the lead at 1120 km (poor Dancer has only gotten 1056 km by that point).
# So, in this situation, Comet would win (if the race ended at 1000 seconds).
#
# Given the descriptions of each reindeer (in your puzzle input), after exactly
# 2503 seconds, what distance has the winning reindeer traveled?

class Reindeer
  attr_accessor :name, :speed, :fly_time, :fly_time_left, :rest_time,
                :rest_time_left, :distance
  def initialize(description)
    description = description.split
    self.name = description[0]
    self.speed = description[3].to_i
    self.fly_time = self.fly_time_left = description[6].to_i
    self.rest_time, self.rest_time_left = description[-2].to_i, 0
    self.distance = 0
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

  def race(seconds)
    seconds.times { go }
  end
end

contestants = File.readlines("./input/reindeer.txt")
race = []

contestants.each do |contestant|
  race << Reindeer.new(contestant)
end

seconds = 2503

race.each {|reindeer| reindeer.race(seconds)}

puts race.max_by {|reindeer| reindeer.distance }.distance
