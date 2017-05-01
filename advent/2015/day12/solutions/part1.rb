# --- Day 12: JSAbacusFramework.io ---
#
# Santa's Accounting-Elves need help balancing the books after a recent order.
# Unfortunately, their accounting software uses a peculiar storage format.
# That's where you come in.
#
# They have a JSON document which contains a variety of things: arrays
# ([1,2,3]), objects ({"a":1, "b":2}), numbers, and strings. Your first job is
# to simply find all of the numbers throughout the document and add them
# together

json = File.read("./input/json.txt")

p json.scan(/-?\d*/).map(&:to_i).inject(:+)
