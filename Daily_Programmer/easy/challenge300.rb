## Description
# Let's try something different this week. Our output is going to be sound instead of text/graphics
# Formal Inputs & Outputs
# No real input for this challenge. But this is research/getting familiar with
# the sound framework of your language, for the next 2 challenges.
# You create an applition that produces Do–Re–Mi–Fa–Sol–La–Si of the Solfège.
## Bonus
# Be able to output Chords

require "win32/sound"
include Win32

def play_scale
  Sound.beep(262, 250)
  Sound.beep(294, 250)
  Sound.beep(330, 250)
  Sound.beep(349, 250)
  Sound.beep(392, 250)
  Sound.beep(440, 250)
  Sound.beep(494, 250)
  Sound.beep(548, 250)
end

play_scale

#+#+#+ Bonus +#+#+#
require "micromidi"

output = UniMIDI::Output.use(:first)

MIDI.using(output) do
  note "C"
  note "E"
  note "G" # Chord of C
  sleep(2) # let it breathe
  off
end
