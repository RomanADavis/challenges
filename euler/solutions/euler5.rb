# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?

def lowerst_multiple_of_numbers_up_to number
  multiple = 1
  (1..number).each do |n|
    i = 1
    until (multiple % n).zero?
      multiple *= i if ((i * multiple) % n).zero?
      i += 1
    end
  end
  multiple
end

p lowerst_multiple_of_numbers_up_to 10
p lowerst_multiple_of_numbers_up_to 20
