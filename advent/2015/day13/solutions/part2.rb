# --- Part Two ---
#
# In all the commotion, you realize that you forgot to seat yourself. At this
# point, you're pretty apathetic toward the whole thing, and your happiness
# wouldn't really go up or down regardless of who you sit next to. You assume
# everyone else would be just as ambivalent about sitting next to you, too.
#
# So, add yourself to the list, and give all happiness relationships that
# involve you a score of 0.
#
# What is the total change in happiness for the optimal seating arrangement that
# actually includes yourself?


class Guest
  relationships = File.readlines("./input/relationships.txt")

  @@table = {}

  relationships.each do |relationship|
    relationship = relationship[0...-2].split # Take off the period

    a, b = relationship.first, relationship.last
    sign = relationship[2] == "gain" ? 1 : -1
    happiness_units = sign * relationship[3].to_i

    @@table[a] = {} unless @@table[a]
    @@table[a][b] = happiness_units
  end

  ## Adding myself.
  @@table["Roman"] = {}

  @@table.keys.each do |member|
    @@table["Roman"][member] = 0
    @@table[member]["Roman"] = 0
  end

  def initialize(name, left, right)
    @name, @left, @right = name, left, right
  end

  def happiness
    @@table[@name][@right] + @@table[@name][@left]
  end

  def self.maximum_happiness
    arrangements = []

    @@table.keys.permutation.to_a.each do |arrangement|
      arrangements << (arrangement + [arrangement[0], arrangement[1]])
        .each_cons(3).map { |left, name, right| self.new(name, left, right).happiness }
          .inject(:+)
    end
    arrangements.max
  end
end

puts Guest.maximum_happiness
