#Your challenge for today is to create a program which is password protected,
#and wont open unless the correct user and password is given.
#For extra credit, have the user and password in a seperate .txt file.

user = ARGV.first

user_db = {}

File.open("users.txt").readlines.map do |line|
  line = line.split(" ")
  user_db[line[1]] = line[3..-1].join(" ")
end

unless user_db[user]
  puts "That user does not exist."
  exit(0)
end


print "[Password]>"
if $stdin.gets.chomp == user_db[user]
  puts "Welcome to my short program. Goodbye!"
else
  puts "INCORRECT PASSWORD"
end


#for even more extra credit, break into your own program :)
