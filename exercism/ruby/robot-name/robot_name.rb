class Robot < Struct.new(:name)
  @@past_names = []
  def initialize
    reset
  end

  def generate_name
    letter = ->(){('A'..'Z').to_a[rand(26)]}
    number = ->(){(0..9).to_a[rand(10)]}
    "#{letter[]}#{letter[]}#{number[]}#{number[]}#{number[]}"
  end

  def reset
    self.name = generate_name
    self.name = generate_name until !@@past_names.include? self.name
    @@past_names << self.name
  end
end

module BookKeeping
  VERSION = 2
end
