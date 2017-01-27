# --- Day 10: Elves Look, Elves Say ---
#
# Today, the Elves are playing a game called look-and-say. They take turns
# making sequences by reading aloud the previous sequence and using that reading
# as the next sequence. For example, 211 is read as "one two, two ones", which
# becomes 1221 (1 2, 2 1s).
#
# Look-and-say sequences are generated iteratively, using the previous value as
# input for the next step. For each step, take the previous value, and replace
# each run of digits (like 111) with the number of digits (3) followed by the
# digit itself (1).

input = 1321131112.to_s

def look_say(number)
  output = ""
  digits = /^(.)\1*/
  while number.length > 0
    current = number.match(digits)
    number.gsub!(digits, "")
    output += "#{current.to_s.length}#{current.to_s[0]}"
  end
  output
end

40.times { input = look_say(input) }

puts input.lengt
