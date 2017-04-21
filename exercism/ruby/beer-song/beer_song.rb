class BeerSong
  def verses(a, z)
    output = ""
    until a < z
      output += verse(a) + "\n"
      a -= 1
    end
    output.chomp
  end

  def verse(n)
    phrase = "Take #{n > 1 ? "one" : "it"} down and pass it around"
    phrase = "Go to the store and buy some more" if n == 0
<<-VERSE
#{bottles(n)} of beer on the wall, #{bottles(n).downcase} of beer.
#{phrase}, #{bottles(n - 1).downcase} of beer on the wall.
VERSE
  end

  def bottles(n)
    n = 99 if n == -1
    "#{n == 0 ? "No more" : n} #{n == 1 ? "bottle" : "bottles"}"
  end
end

module BookKeeping
  VERSION = 3
end
