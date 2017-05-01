# --- Part Two ---
#
# Now, let's go the other way. In addition to finding the number of characters
# of code, you should now encode each code representation as a new string and
# find the number of characters of the new encoded representation, including the
# surrounding double quotes.

strings = File.read("./input/strings.txt").chomp.split("\n")

slashes = strings.map {|string| "\"" + string.gsub("\\", "\\\\\\").gsub("\"", "\\\"") + "\"" }

string_count = strings.inject(0) {|total, string| total + string.length}
slash_count = slashes.inject(0) {|total, slash| total + slash.length}

puts slash_count - string_count
