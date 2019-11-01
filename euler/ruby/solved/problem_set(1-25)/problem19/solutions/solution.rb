class Date

  attr_accessor :year, :day, :month, :weekday
  def initialize
    @months = {Jan: 31, Feb: 28, Mar: 31, Apr: 30, May: 31, June: 30, July: 31,
               Aug: 31, Sep: 30, Oct: 31, Nov: 30, Dec: 31}

    @days   = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday",
               "Sunday"]

    self.year    = 1900
    self.day     = 1
    self.month   = :Jan
    self.weekday = @days[0]
  end

  def succ!
    self.day += 1
    self.weekday = @days[(@days.find_index(self.weekday) + 1) % @days.length]
    if self.day > @months[self.month]
      self.day = 1
      self.month = @months.keys[(@months.keys.find_index(self.month) + 1) % @months.length]
      if self.month == :Jan
        self.year += 1
        leapyear? ? @months[:Feb] = 29 : @months[:Feb] = 28
      end
    end
  end

  def leapyear?
    self.year % 4 == 0 && (self.year % 100 != 0 || self.year % 400 == 0)
  end

  def solve
    count = 0
    succ! until self.year == 1901
    
    until self.year == 2000 && self.month == :Dec && self.day == 31
      succ!
      count += 1 if self.day == 1 && self.weekday == "Sunday"
    end

    count
  end
end

p Date.new.solve
