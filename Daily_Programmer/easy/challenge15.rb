# Write a program to left or right justify a text file

width = 10

File.open("challenge15.rb", "r") do |file|
  file.readlines.each {|line| puts line.rjust(80)}
end
