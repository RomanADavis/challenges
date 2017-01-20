#create a program that will ask the users name, age, and reddit username. have
#it tell them the information back, in the format:
##your name is (blank), you are (blank) years old, and your username is (blank)
#for extra credit, have the program log this information in a file to be
#accessed later.

def input(type)
  print "#{type}>"
  gets.chomp
end

puts "I'd like some information from you today."
name = input("name")
age =  input("age")
username = input("username")

puts "your name is #{name}, you are #{age} years old, and your username is #{username}."

File.open("output", "w") do |file|
  file.write("Name: #{name} Age: #{age} Username: #{username}")
end
