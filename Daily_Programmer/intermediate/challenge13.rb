# Create a program that will take any string and write it out to a text file,
# reversed.
# input: "hello!"
# output: "!olleh"

# Rolled my own recursive reverse to show off.
def reverse string
  return string if string.length < 2
  string[-1] + reverse(string[1...-1]) + string[0]
end

File.open("reversed.txt", "w") {|file| file.write(reverse (ARGV.first) ) }
