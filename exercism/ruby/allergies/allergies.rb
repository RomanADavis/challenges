class Allergies
  ALLERGIES = ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes",
               "chocolate", "pollen", "cats"]

  def initialize(score)
    scores = score.to_s(2).reverse.chars.map(&:to_i)

    @allergies = ALLERGIES.select.with_index do |_, index|
      scores[index] && scores[index] > 0
    end
  end

  def allergic_to?(allergy)
    @allergies.include? allergy
  end

  def list
    @allergies
  end
end
