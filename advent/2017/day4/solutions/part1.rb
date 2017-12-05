# --- Day 4: High-Entropy Passphrases ---
#
# A new system policy has been put in place that requires all accounts to use a
# passphrase instead of simply a password. A passphrase consists of a series of
# words (lowercase letters) separated by spaces.
#
# To ensure security, a valid passphrase must contain no duplicate words.

def validate(passphrase)
  words = passphrase.split
  words == words.uniq
end

passphrases = File.readlines("../input/passphrases.txt")

p validate("abcde fghij")
p validate("abcde xyz ecdab")
p validate("a ab abc abd abf abj")
p validate("iiii oiii ooii oooi oooo")
p validate("oiii ioii iioi iiio")
p passphrases.count {|phrase| validate(phrase)}
