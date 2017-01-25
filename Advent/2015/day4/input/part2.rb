require "digest"

def coinmine(string, zeroes = 5, iterator = 0)# Can't resist golfing
  number += 1 until Digest::MD5.hexdigest(string + number.to_s)[0..zeroes] == "0" * zeroes
end

#puts coinmine
