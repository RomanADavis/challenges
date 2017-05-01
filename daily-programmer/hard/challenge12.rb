# Write a program which will take string inputs "A", "B", "C", "D", "E", "F",
# and "G", and make the corresponding notes, in any method of your choosing.
# Thanks to electric_machinery for this challenge!

require "win32/sound"
include Win32

# Letter : Frequency
key = {
  a: 440,
  b: 494,
  c: 523,
  d: 587,
  e: 659,
  f: 698,
  g: 784
}

notes = ARGV.first
notes.chars do |note|
  frequency = key[note.to_sym]
  Sound.beep(frequency, 200)
end
