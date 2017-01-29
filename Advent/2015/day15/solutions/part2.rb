# --- Part Two ---
#
# Your cookie recipe becomes wildly popular! Someone asks if you can make
# another recipe that has exactly 500 calories per cookie (so they can use it as
# a meal replacement). Keep the rest of your award-winning process the same
# (100 teaspoons, same ingredients, same scoring system).
#
# For example, given the ingredients above, if you had instead selected 40
# teaspoons of butterscotch and 60 teaspoons of cinnamon (which still adds to
# 100), the total calorie count would be 40*8 + 60*3 = 500. The total score
# would go down, though: only 57600000, the best you can do in such trying
#   circumstances.
#
# Given the ingredients in your kitchen and their properties, what is the total
# score of the highest-scoring cookie you can make with a calorie total of 500?

ingredients = File.readlines("./input/ingredients.txt")

Ingredient = Struct.new(:capacity, :durability, :flavor, :texture, :calories)

class Cookie < Ingredient
  def initialize(mixture) # Ugly repetitive code. How to fix?
    self.durability = mixture.inject(0) {|total, ingredient| total + ingredient.durability}
    self.durability = 0 unless self.durability > 0
    self.capacity = mixture.inject(0) {|total,ingredient| total + ingredient.capacity}
    self.capacity = 0 unless self.capacity > 0
    self.flavor = mixture.inject(0) {|total, ingredient| total + ingredient.flavor}
    self.flavor = 0 unless self.flavor > 0
    self.texture = mixture.inject(0) {|total, ingredient| total + ingredient.texture}
    self.texture = 0 unless self.texture > 0
    self.calories = mixture.inject(0) {|total, ingredient| total + ingredient.calories}
  end

  def total
    self.durability * self.capacity * self.flavor * self.texture
  end
end

ingredients.map! do |description|
  properties = description.split.map(&:chop).map(&:to_i)
  Ingredient.new(properties[2], properties[4], properties[6], properties[8],
    description.split[10].to_i)
end

mixtures = ingredients.repeated_combination(100)

cookies = mixtures.map {|mixture| Cookie.new(mixture)}

puts cookies.select {|cookie| cookie.calories < 500}
            .max_by {|cookie| cookie.total}.total
