#Write a program that can translate Morse code in the format of ...---...
#A space and a slash will be placed between words. ..- / --.-
#For bonus, add the capability of going from a string to Morse code.
#Super-bonus if your program can flash or beep the Morse.
#This is your Morse to translate:
#
require "win32/sound"

class Morse
  include Win32

  @@morse_key = {
    a: ".-",
    b: "-...",
    c: "-.-.",
    d: "-..",
    e: ".",
    f: "..-.",
    g: "--.",
    h: "....",
    i: "..",
    j: ".---",
    k: "-.-",
    l: ".-..",
    m: "--",
    n: "-.",
    o: "---",
    p: ".--.",
    q: "--.-",
    r: ".-.",
    s: "...",
    t: "-",
    u: "..-",
    v: "...-",
    w: ".-.-",
    x: "-..-",
    y: "-.--",
    z: "--.."
  }

  def self.deencrypt(morse)
    words = morse.split(" / ")
    words.map! do |word|
      word = word.split(" ")
      word.map { |letter| @@morse_key.key(letter).to_s }.join
    end
    words.join(" ")
  end

  def self.encrypt(english)
    english = english.chars.map do |char|
      char == " " ? "/" : @@morse_key[char.downcase.to_sym]
    end
    english.join(" ")
  end

  def self.beep(morse)
    morse.chars.each do |char|
      case char
      when "\\" then sleep(0.08)
      when " " then sleep(0.02)
      when "." then Sound.beep(800, 100)
      when "-" then Sound.beep(600, 200)
      end
    end
  end
end

## GHETTO TESTS
#code = ".... . .-.. .-.. --- / -.. .- .. .-.. -.-- / .--. .-. --- --. .-. .- -- -- . .-. / --. --- --- -.. / .-.. ..- -.-. -.- / --- -. / - .... . / -.-. .... .- .-.. .-.. . -. --. . ... / - --- -.. .- -.--"
#
# puts Morse.deencrypt(code)
# puts test = Morse.encrypt("The rain in Spain falls mainly on the plain.")
# puts Morse.deencrypt(test)
# Morse.beep(code)

puts message = Morse.encrypt(ARGV.first)
Morse.beep(message)
