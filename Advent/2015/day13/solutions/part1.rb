# --- Day 13: Knights of the Dinner Table ---
# In years past, the holiday feast with your family hasn't gone so well. Not
# everyone gets along! This year, you resolve, will be different. You're going
# to find the optimal seating arrangement and avoid all those awkward
# conversations.
#
# You start by writing up a list of everyone invited and the amount their
# happiness would increase or decrease if they were to find themselves sitting
# next to each other person. You have a circular table that will be just big
# enough to fit everyone comfortably, and so each person will have exactly two
# neighbors.

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

  @@family_members = @@table.keys


  def initialize(name, left, right)
    @name, @left, @right = name, left, right
  end

  def happiness
    @@table[@name][@right] + @@table[@name][@left]
  end

  def self.maximum_happiness
    arrangements = []

    @@family_members.permutation.to_a.each do |arrangement|
      arrangements << (arrangement + [arrangement[0], arrangement[1]])
        .each_cons(3).map { |left, name, right| self.new(name, left, right).happiness }
          .inject(:+)
    end
    arrangements.max
  end
end

puts Guest.maximum_happiness
