require "digest"

iterator = 0
# Can't resist golfing
iterator += 1 until Digest::MD5.hexdigest("ckczppom" + iterator.to_s)[0..5] == "0" * 6

p iterator
