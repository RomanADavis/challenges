class String
  @@alphabet = ("a".."z").to_a

  def rot(n)
    encoded = self.chars.map do |char|
      @@alphabet[(@@alphabet.find_index(char) + n) % @@alphabet.length]
    end
    encoded.join
  end
end

print ">"
puts $stdin.gets.chomp.rot(13)
