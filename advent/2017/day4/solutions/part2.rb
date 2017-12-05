# For added security, yet another system policy has been put in place. Now, a
# valid passphrase must contain no two words that are anagrams of each other -
# that is, a passphrase is invalid if any word's letters can be rearranged to
# form any other word in the passphrase.

def validate(passphrase)
  words = passphrase.split
  permutations = words.map {|word| word.split('').permutation.map(&:join)}
  permutations.map!(&:uniq) # Gets rid of extra permutations from repeated words
  permutations.flatten!

  permutations == permutations.uniq
end

p validate("abcde fghij")
p validate("abcde xyz ecdab")
p validate("a ab abc abd abf abj")
p validate("iiii oiii ooii oooi oooo")
p validate("oiii ioii iioi iiio")

passphrases = File.readlines("../input/passphrases.txt")

p passphrases.count {|phrase| validate(phrase)}
