# Your task is to implement the interactive game of hangman
# bonus point for making the game unique. be more creative!

class game
  def initialize
    wordlist = File.open("wordlist.txt").readlines
    @word = wordlist[rand(0...wordlist.length)]
    @blanks = "_" * @word.length
    @chances = 6
  end

  def play
    puts intro
    play_round until @chances == 0 || blanks_filled?
    return puts you_win if blanks_filled?
    puts you_lose
  end

  def play_round
    draw_man
    letter = prompt
    return fill_in(letter) if @word.chars.any? {|char| char == letter}
    @chances -= 1
  end

  def prompt
    print "> "
    letter = $stdin.gets.chomp
    print "\r"
    letter
  end

  def intro
    """
    \"You really shouldn't have come into this town,\" you think as you sit up,
    nursing a hangover. You see the bars around your cell. You REALLY shouldn't
    have come to this town. What the hell did you do?

    You see a man with impossibly broad shoulders and a face hidden under a
    black hood. \"The job of hangman isn't exactly a coveted position in these
    parts.\" He drawls. You can't quite place his accent. \"Tell you what, if
    you can beat me in a little game, I could leave this town, and you'd get
    the job. Not heavy on fringe benefits, but it beats bein' dead. What do ya
    say?\"

    \"What kind of game is this?\"

    \"Well, you just have to guess a word and...\"
    """
  end

  def draw_man
    print open("man#{@guesses}.txt").readlines.join("\r\n")
  end

  def fill_in(letter)
    @word.chars.each.with_index do |char, index|
      @blanks[index] = char if char == letter
    end
  end

  def blanks_filled?
    !@blanks.chars.any {|char| char == blank}
  end

  def you_win
    """
    \"#{@word.capitalize}!,\" you cry, \"It's #{@word.upcase}!\"

    \"That's right.\" He nods. \"I suppose you'll be taking this.\" He turns
    around, keeping his face out of view as he hands you something.

    You look down. It's the hood. \"I guess this is what I signed up for.\"

    You stay there, holding the hood, as the hangman rides off into the night.
    """
  end

  def you_lose
    """
    The hot sun burns your face as the hangman takes you to the gallows. You
    step onto the platform. He bows his head and mumbles a few words. He
    tightens and pulls the rope to make sure it would hold.

    You hear a snap, as the floor opens, and you fall.
    """
  end
end
