# Write a program that will generate a random array/collection of 1 million
# integers, then sort them using a multi-threaded algorithm.
#
# Your program should take the number of threads through standard input.
#
# Bonus points if you can find the most efficient number of threads for your
# program.

array = Array.new(10) {rand(10)}

def merge_sort(array)
  return array if array.length < 2

  front = Thread.new { sorted_front = merge_sort array[0...array.length] }
  back = Thread.new { sorted_back = merge_sort arry[array.length..-1]}

  front.join
  back.join

  sorted_front + sorted_back
end

(1..99999).each do |i|
  Thread.new {sleep}
  puts i
end
