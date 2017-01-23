# Write a small program that can take a string:
# "hi!"
# and print all the possible permutations of the string:
# "hi!"
# "ih!"
# "!hi"
# "h!i"
# "i!h"
# etc...
# thanks to hewts for this challenge!

ARGV.first.chars.permutation.to_a.each { |permutation| puts permutation.join }
