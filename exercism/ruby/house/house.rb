class House
  NOUNS = ["house that Jack built.", "malt\nthat lay in", "rat\nthat ate",
           "cat\nthat killed", "dog\nthat worried",
           "cow with the crumpled horn\nthat tossed",
           "maiden all forlorn\nthat milked",
           "man all tattered and torn\nthat kissed",
           "priest all shaven and shorn\nthat married",
           "rooster that crowed in the morn\nthat woke",
           "farmer sowing his corn\nthat kept",
           "horse and the hound and the horn\nthat belonged to"
         ]

  def self.recite
    poem = ""
    NOUNS.each_with_index do |noun, index|
      poem += "This is the #{noun}"
      NOUNS[0...index].reverse.each {|n| poem += " the #{n}"}
      poem += "\n\n"
    end
    poem.chomp
  end
end
