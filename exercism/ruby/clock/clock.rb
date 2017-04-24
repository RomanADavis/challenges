class Clock < Struct.new(:hour, :minute)
  def self.at(hour, minute)
    while minute.negative?
      hour -= 1
      minute += 60
    end
    hour += 24 while hour.negative?
    Clock.new(hour, minute)
  end

  def initialize(hour, minute)
    self.hour = (minute / 60 + hour) % 24
    self.minute = minute % 60
  end

  def to_s
    pad = ->(n){n.to_s.rjust(2, "0")}
    "#{pad.(self.hour)}:#{pad.(self.minute)}"
  end

  def +(minutes)
    Clock.at(self.hour, self.minute + minutes)
  end

  def ==(other)
    return false unless other.is_a? Clock
    self.hour == other.hour && self.minute == other.minute
  end
end

module BookKeeping
  VERSION = 2
end
