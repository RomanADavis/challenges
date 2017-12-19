# It occurs to me just after doing this that I went about it all wrong. The idea
# should have been to *build* the pandigital piece by piece. The first number
# can be any number but zero, the the fourth has to be an even digit, you have
# to save a five or zero for the 6th number. As you build it, you'd *lose* a ton
# of combinations because of the restrictions on what's really allowed. I don't
# think you'd ever have to build an array that goes over a few hundred this way
# and you'd certainly never have to build anything like the 3.6 million element
# monster I build for this solution. Hopefully I can take another shot at this
# problem later.

class SubstringDivisibility
  def self.all # It takes several seconds just to load this all! What am I to do?
    pandigitals = ('0'..'9').to_a.permutation.map(&:join)
    pandigitals.reject! {|pandigital| pandigital.length != 10}
    pandigitals
  end

  def self.solve
    solutions = all.select! do |pandigital|
      pandigital[1..3].to_i % 2  == 0 && pandigital[2..4].to_i % 3  == 0 &&
      pandigital[3..5].to_i % 5  == 0 && pandigital[4..6].to_i % 7  == 0 &&
      pandigital[5..7].to_i % 11 == 0 && pandigital[6..8].to_i % 13 == 0 &&
      pandigital[7..9].to_i % 17 == 0
    end

    solutions.map(&:to_i).inject(:+)
  end
end

p SubstringDivisibility.solve
