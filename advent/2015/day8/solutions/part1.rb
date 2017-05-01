# --- Day 8: Matchsticks ---
#
# Space on the sleigh is limited this year, and so Santa will be bringing his
# list as a digital copy. He needs to know how much space it will take up when
# stored.
#
# It is common in many programming languages to provide a way to escape special
# characters in strings. For example, C, JavaScript, Perl, Python, and even PHP
# handle special characters in very similar ways.
#
# However, it is important to realize the difference between the number of
# characters in the code representation of the string literal and the number of
# characters in the in-memory string itself.

input = File.read("./input/strings.txt").chomp.split("\n")
code_count = input.inject(0) {|total, string| total + string.length}
char_count = input.inject(0) {|total, string| total + eval(string).length}

puts code_count - char_count
