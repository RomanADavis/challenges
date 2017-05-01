# --- Part Two ---

# Turns out the shopkeeper is working with the boss, and can persuade you to 
# buy whatever items he wants. The other rules still apply, and he still only 
# has one of each item.

# What is the most amount of gold you can spend and still lose the fight?

require_relative "part1.rb"

armor = parse_equipment("./input/armor.txt")
weapons = parse_equipment("./input/weapons.txt")
rings = parse_equipment("./input/rings.txt")

weapon_combos = weapons.combination(1).to_a
armor_combos = armor.combination(0).to_a + armor.combination(1).to_a
ring_combos = rings.combination(0).to_a + rings.combination(1).to_a + rings.combination(2).to_a

cost = 0 # Least expensive loadout
loadout = ""
weapon_combos.each do |weapon_array|
  armor_combos.each do |armor_array|
    ring_combos.each do |ring_array|
      player = Player.equip(weapon_array + armor_array + ring_array)
      if !player.would_win? && (player.expense > cost)
        cost = player.expense
        loadout = player
      end
    end
  end
end

p cost

