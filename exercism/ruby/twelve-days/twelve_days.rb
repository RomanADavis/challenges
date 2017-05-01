# twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping,
# nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming,
# six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens,
# two Turtle Doves, and a Partridge in a Pear Tree.
class TwelveDays
  GIFTS = ["and a Partridge in a Pear Tree", "two Turtle Doves",
           "three French Hens", "four Calling Birds", "five Gold Rings",
           "six Geese-a-Laying", "seven Swans-a-Swimming",
           "eight Maids-a-Milking", "nine Ladies Dancing",
           "ten Lords-a-Leaping", "eleven Pipers Piping",
           "twelve Drummers Drumming"]

  DAYS = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh",
          "eighth", "ninth", "tenth", "eleventh", "twelfth"]

  def self.song
    days = (1..12).to_a.inject("") {|song, n| "#{song}\n#{day(n)}\n"}
    days.lstrip
  end

  def self.day(day)
    start = "On the #{DAYS[day - 1]} day of Christmas my true love gave to me, "
    gifts = GIFTS[0...day].reverse.join(", ")
    gifts = "a Partridge in a Pear Tree" if day == 1
    "#{start}#{gifts}."
  end
end

class BookKeeping
  VERSION = 2
end
