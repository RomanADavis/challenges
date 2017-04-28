class FoodChain
  def self.song
    animals = ["fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"]

    verses = animals.inject("") do |song, animal|
      song += Verse.new(animal).content
    end

    verses.chomp
  end
end

class Verse
  # Probably not the tersest way to do this.
  INTROS = {"fly" => "",
            "spider" => "It wriggled and jiggled and tickled inside her.",
            "bird" => "How absurd to swallow a bird!",
            "cat" => "Imagine that, to swallow a cat!",
            "dog" => "What a hog, to swallow a dog!",
            "goat" => "Just opened her throat and swallowed a goat!",
            "cow" => "I don't know how she swallowed a cow!",
            "horse" => "She's dead, of course!"
          }

  EXPLANATIONS = {"fly" => "I don't know why she swallowed the fly. Perhaps she'll die.",
                  "spider" => "She swallowed the spider to catch the fly.",
                  "bird" => "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
                  "cat" => "She swallowed the cat to catch the bird.",
                  "dog" => "She swallowed the dog to catch the cat.",
                  "goat" => "She swallowed the goat to catch the dog.",
                  "cow" => "She swallowed the cow to catch the goat."
                }

  attr_accessor :content
  def preamble(animal)
    "I know an old lady who swallowed a #{animal}.\n" +
    (INTROS[animal].empty? ? "" : "#{INTROS[animal]}\n")
  end

  def explain(animal)
    animals = INTROS.keys
    return "" unless EXPLANATIONS[animal]

    animals[0..animals.find_index(animal)].inject("") do |explanation, animal|
      EXPLANATIONS[animal] + "\n" + explanation
    end
  end

  def initialize(animal)
    self.content = preamble(animal) + explain(animal) + "\n"
  end
end
