# write a program that will allow the user to input digits, and arrange them in
# numerical order.
# for extra credit, have it also arrange strings in alphabetical order

class String
  def number?
    self.to_i.to_s == self
  end
end

puts "Seperate each item by a space and I'll take as many as you want."
print ">"

values = $stdin.gets.chomp.downcase.split
values.map!(&:to_i) if values.all? {|value| value.number? }

puts values.sort.join(" ")
