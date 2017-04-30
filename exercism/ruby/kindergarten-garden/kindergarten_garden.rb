class Garden
  LETTER_TO_PLANT = {G: :grass, C: :clover, R: :radish, V: :violets}

  def self.rollcall(*kids) # Getters and setters for the kids_gardens hash
    kids.each do |kid|
      define_method(kid) do
        instance_variable_get("@kids_gardens[:#{kid}]")
      end
      define_method("#{kid}=") do |value|
        instance_variable_set("@kids_gardens[:#{kid}]", value)
      end
    end
  end

  KIDS = [:alice, :bob, :charlie, :david, :eve, :fred, :ginny, :harriet,
          :ileana, :joseph, :kincaid, :larry]

  rollcall *KIDS

  rollcall :alice
  def initialize(window_sill)
    rows = window_sill.split("\n")
    self.plants = rows.map do |row|
      row.chars.map {|letter| LETTER_TO_PLANT[letter.to_sym]}
    end

    @kids_gardens = Hash.new([])

    self.plants.each do |row|
      row.each_with_index do |plant, plant_index|
        @kids_gardens[KIDS[plant_index / 2]]
      end
    end
  end
end
