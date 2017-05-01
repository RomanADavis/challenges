# --- Part Two ---

# The Elves decide they don't want to visit an infinite number of houses. 
# Instead,each Elf will stop after delivering presents to 50 houses. To make 
# up for it, they decide to deliver presents equal to eleven times their number 
# at each house.

# With these changes, what is the new lowest house number of the house to get 
# at least as many presents as the number in your puzzle input?

def factors(number)
  factors = []
  iterator = 1
  while iterator * iterator <= number
    if number % iterator == 0
      [iterator, number / iterator].uniq.each {|factor| factors << factor }
    end
    iterator += 1
  end
  factors
end

def presents(house)
  factors(house).select {|factors| factors >= house / 50}.inject(:+) * 11
end

def lowest_house_number(input)
  house = gifts = 0
  while gifts <= input
    house += 1
    gifts = presents(house)
  end
  house
end

input = 34000000
p lowest_house_number(input)