# today, your challenge is to create a program that will take a series of
#numbers (5, 3, 15), and find how those numbers can add, subtract, multiply, or
#divide in various ways to relate to eachother. This string of numbers should
#result in 5 * 3 = 15, or 15 /3 = 5, or 15/5 = 3. When you are done, test your
#numbers with the following strings:
#
# 4, 2, 8
# 6, 2, 12
# 6, 2, 3
# 9, 12, 108
# 4, 16, 64

def relation(first, second, third)
  return  "#{first} * #{second} = #{third}" if first * second == third
  return "#{first} / #{second} = #{third}" if first / second == third
end

puts relation 4, 2, 8
puts relation 6, 2, 12
puts relation 6, 2, 3
puts relation 9, 12, 108
puts relation 4, 16, 64

# For extra credit, have the program list all possible combinations.

def all_relations(*numbers)
  relations = []
  relations << relation(numbers[0], numbers[1], numbers[2])
  numbers.rotate!
  relations << relation(numbers[0], numbers[1], numbers[2])
  numbers.rotate!
  relations << relation(numbers[0], numbers[1], numbers[2])
  relations
end


# for even more extra credit, allow the program to deal with strings of greater
#than three numbers. For example, an input of (3, 5, 5, 3) would be 3 * 5 = 15,
#15/5 = 3. When you are finished, test them with the following strings.
#
# 2, 4, 6, 3
# 1, 1, 2, 3
# 4, 4, 3, 4
# 8, 4, 3, 6
# 9, 3, 1, 7


def all_results(*numbers)
  results = []
  numbers.combination(2).to_a.each do |combo|
    results << "#{combo.first} * #{combo.last} = #{combo.first * combo.last}"
    if combo.first % combo.last == 0
      results << "#{combo.first} / #{combo.last} = #{combo.first / combo.last}"
    elsif combo.last % combo.first == 0
      results << "#{combo.last} / #{combo.first}= #{combo.last / combo.first} "
    end
  end
  results.uniq
end

puts all_results 2, 4, 6, 3
puts all_results 1, 1, 2, 3
puts all_results 4, 4, 3, 4
puts all_results 8, 4, 3, 6
puts all_results 9, 3, 1, 7
