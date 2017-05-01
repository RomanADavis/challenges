text = File.open("sample.txt") {|file| file.read}

puts text

puts "What string would you like to replace?"
print "> "
substring = gets.chomp

puts "What would you like to replace it with?"
print "> "
replacement = gets.chomp

text.gsub! substring, replacement

puts text

File.open("sample.txt", "w") {|file| file.write(text)}
