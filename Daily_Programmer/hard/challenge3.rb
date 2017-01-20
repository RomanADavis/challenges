scrambles = %w(mkeart sleewa edcudls iragoge usrlsle nalraoci nsdeuto amrhat
  inknsy iferkna)

words = File.open("wordlist.txt").readlines

scrambles.each do |scramble|
  chars = scramble.chars
  words.each do |word|
    if chars - word.chars == []
      puts word
      break
    end
  end
end
