# --- Day 11: Corporate Policy ---
#
# Santa's previous password expired, and he needs help choosing a new one.
#
# To help him remember his new password after the old one expires, Santa has
# devised a method of coming up with a password based on the previous one.
# Corporate policy dictates that passwords must be exactly eight lowercase
# letters (for security reasons), so he finds his new password by incrementing
# his old password string repeatedly until it is valid.
#
# Incrementing is just like counting with numbers: xx, xy, xz, ya, yb, and so
# on. Increase the rightmost letter one step; if it was z, it wraps around to a,
# and repeat with the next letter to the left until one doesn't wrap around.
#
# Unfortunately for Santa, a new Security-Elf recently started, and he has
# imposed some additional password requirements:
#
#   * Passwords must include one increasing straight of at least three letters,
#     like abc, bcd, cde, and so on, up to xyz. They cannot skip letters; abd
#     doesn't count.
#   * Passwords may not contain the letters i, o, or l, as these letters can be
#     mistaken for other characters and are therefore confusing.
#   * Passwords must contain at least two different, non-overlapping pairs of
#     letters, like aa, bb, or zz.

class Password
  attr_accessor :password
  def initialize(password)
    self.password = password
  end

  def next!
    self.password.next!
    self.password.next! until valid?
    self
  end

  def valid?
    return false if confusing_letters?
    return false unless two_pairs?
    ascending?
  end

  def ascending?
    password.chars.each_cons(3) do |a, b, c|
      return true if a.next == b && b.next == c
    end
    false
  end

  def two_pairs?
    match = self.password.match(/(.)\1/) # Repeated letter
    return false unless match
    password = self.password.gsub(match.to_s, "_*") #replace letter with garbage
    return password.match(/(.)\1/) ? true : false
  end

  def confusing_letters? # Probably too cute.
    password.match(/i|o|l/)
  end
end

puts Password.new("vzbxkghb").next!.password
