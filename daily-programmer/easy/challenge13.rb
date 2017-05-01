# Find the number of the year for the given date. For example, january 1st would
# be 1, and december 31st is 365.
#
# for extra credit, allow it to calculate leap years, as well.

month, day, year = ARGV[0].to_i, ARGV[1].to_i, ARGV[2].to_i || 1999

days_in_a_month = [31, 28, 31, 30, 31, 30, 31, 30, 31, 30, 31]

                           # Check for leap years
days_in_a_month[1] += 1 if year % 4 == 0 && (year % 100 != 0 || year % 1000 == 0)

leading_months = month == 1 ? 0 : days_in_a_month[0...(month - 1)].inject(:+)
puts leading_months + day
