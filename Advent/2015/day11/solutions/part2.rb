# --- Part Two ---
#
# Santa's password expired again. What's the next one?

require_relative "part1"

puts Password.new("vzbxkghb").next!.next!.password
