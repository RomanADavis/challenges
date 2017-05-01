# You're challenge for today is to create a random password generator!
# For extra credit, allow the user to specify the amount of passwords to
#generate.
# For even more extra credit, allow the user to specify the length of the
#strings he wants to generate!

 # Passwords can be kind of crap. In the interest of making them more memorable
 #and more secure, I'm going for passphrases.

class PassPhrase
   @@wordlist = File.open("wordlist.txt").readlines
  def initialize(number_of_words)
    @length = number_of_words
    @chance = Random.new
  end

  def self.devise(length)
    new(length).generate
  end

  def generate
    result = []
    @length.times { result << word }
    result.join(" ")
  end

  def word
    @@wordlist[@chance.rand(0...@@wordlist.length)].chomp
  end
end

puts "How many words would you like in your passphrase?"
puts PassPhrase.devise($stdin.gets.chomp.to_i)
