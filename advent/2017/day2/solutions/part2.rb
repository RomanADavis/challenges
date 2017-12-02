# -- Part Two ---
#
# "Great work; looks like we're on the right track after all. Here's a star for
# your effort." However, the program seems a little worried. Can programs be
# worried?
#
# "Based on what we're seeing, it looks like all the User wanted is some
# information about the evenly divisible values in the spreadsheet.
# Unfortunately, none of us are equipped for that kind of calculation - most of
# us specialize in bitwise operations."
#
# It sounds like the goal is to find the only two numbers in each row where one
# evenly divides the other - that is, where the result of the division operation
# is a whole number. They would like you to find those numbers on each line,
# divide them, and add up each line's result.

def check(sheet)
  cells = sheet.map {|row| row.split.map {|cell| cell.to_i} }

  total = 0

  cells.each do |row|
    row.each do |cell|
      row.each do |divisor|
        dividend, modulo = cell.divmod(divisor)
        total += dividend if modulo == 0 && dividend != 1
      end
    end
  end

  total
end

p check(File.readlines("./input/part1.txt"))
