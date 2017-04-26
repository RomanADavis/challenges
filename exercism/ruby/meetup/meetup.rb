require "date"
class Meetup
  WEEKDAY_TO_INT = {sunday: 0, monday: 1, tuesday: 2, wednesday: 3,thursday: 4,
                    friday: 5, saturday: 6}
  attr_accessor :date
  def initialize(month, year)
    @date = Date.new(year, month, 1)
  end

  def day(weekday, ordinal)
    return last(weekday) if ordinal == :last
    set_weekday(weekday)
    case ordinal
    when :first then return @date
    when :second then next_week
    when :third then 2.times {next_week}
    when :fourth then 3.times {next_week}
    when :teenth then next_week until teenth?
    else raise ArgumentError
    end
    @date
  end

  def set_weekday(weekday)
    raise ArgumentError unless WEEKDAY_TO_INT[weekday]
    @date = @date.next_day until @date.wday == WEEKDAY_TO_INT[weekday]
  end

  def next_week
    7.times {@date = @date.next_day}
  end

  def teenth?
    (13..19).include? @date.day
  end

  def last(weekday)
    @date = @date.next_month
    @date = @date.prev_day
    @date = @date.prev_day until @date.wday == WEEKDAY_TO_INT[weekday]
    @date
  end
end
