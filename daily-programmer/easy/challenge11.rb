# The program should take three arguments. The first will be a day, the second
# will be month, and the third will be year. Then, your program should compute
# the day of the week that date will fall on.

require "date"

day, month, year = ARGV[0].to_i, ARGV[1].to_i, ARGV[2].to_i

date = Date.new(year, month, day)

weekday = Date::DAYNAMES[date.wday]

puts weekday
