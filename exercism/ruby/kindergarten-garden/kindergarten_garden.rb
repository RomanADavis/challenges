class Garden
  def self.rollcall(*kids) # Getters and setters for the @kids_gardens hash
    kids.each do |kid|
      define_method(kid.downcase.to_sym) do
        @kid_gardens[kid]
      end
    end
  end

  LETTER_TO_PLANT = {G: :grass, C: :clover, R: :radishes, V: :violets}

  attr_accessor :plants
  def initialize(window_sill, kids = nil)

    example = %w(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph
                 Kincaid Larry)

    @kids = kids ? kids.sort : example

    rows = window_sill.split("\n")
    self.plants = rows.map do |row|
      row.chars.map {|letter| LETTER_TO_PLANT[letter.to_sym]}
    end

    assign_plants

    self.class.rollcall *@kids
  end

  def assign_plants
    @kid_gardens = Hash.new()

    self.plants.each do |row| # Is ther a less clunky way to do this?
      row.each_with_index do |plant, plant_index|
        kid = @kids[plant_index / 2]
        if @kid_gardens[kid]
          @kid_gardens[kid] << plant
        else
          @kid_gardens[kid] = [plant]
        end
      end
    end
  end
end
