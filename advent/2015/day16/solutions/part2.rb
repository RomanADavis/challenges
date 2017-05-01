# --- Part Two ---
#
# As you're about to send the thank you note, something in the MFCSAM's
# instructions catches your eye. Apparently, it has an outdated
# retroencabulator, and so the output from the machine isn't exact values - some
# of them indicate ranges.
#
# In particular, the cats and trees readings indicates that there are greater
# than that many (due to the unpredictable nuclear decay of cat dander and tree
# pollen), while the pomeranians and goldfish readings indicate that there are
# fewer than that many (due to the modial interaction of magnetoreluctance).
#
# What is the number of the real Aunt Sue?

sender = {children: 3, cats: 7, samoyeds: 2, pomeranians: 3, akitas: 0,
  vizslas: 0, goldfish: 5, trees: 3, cars: 2, perfumes: 1}

aunts = File.readlines("./input/aunts.txt").map do |line|
  line = line.split(/:\s|,\s|\s/)
  {sue: line[1], line[2].to_sym => line[3].to_i, line[4].to_sym => line[5].to_i,
    line[6].to_sym => line[7].to_i}
end

sender = aunts.find do |aunt|
  sender.all? do |key, value|
    next true if aunt[key].nil?
    next sender[key] < aunt[key] if key == :cats || key == :trees
    next sender[key] > aunt[key] if key == :goldfish || key == :pomeranians
    aunt[key] == sender[key]
  end
end

puts sender[:sue]
