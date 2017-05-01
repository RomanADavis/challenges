words = File.open("wordlist.txt").readlines

def anagrams(word)
  word.downcase.chars.permutation.map(&:join)
end

total = 0

words.each do |word|
  anagrams(word).each do |anagram|
    words.each { |other| total += 1 if anagram == other }
  end
end

puts total
