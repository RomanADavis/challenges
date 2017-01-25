require "digest"

def coinmine(string, zeroes = 5, number = 0)# Can't resist golfing
  number += 1 until Digest::MD5.hexdigest(string + number.to_s)[0..(zeroes - 1)] == "0" * zeroes
  number
end

puts coinmine "bgvyzdsv"
