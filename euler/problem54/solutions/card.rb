class Card
  @@suits  = {C: "Clubs", D: "Diamonds", H: "Hearts", S: "Spades"}

  @@faces  = {A: "Ace", K: "King", Q: "Queen", J: "Jack", T: "Ten",
    9 => "Nine", 8 => "Eight", 7 => "Seven", 6 => "Six", 5 => "Five",
    4 => "Four", 3 => "Three", 2 => "Two"}

  @@values = {2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9,
  'T' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14}

  attr_accessor :suit, :face, :value

  def initialize(string)
    self.suit  = @@suits[string[1].to_sym]
    self.face  = @@faces[string[0].to_i > 0 ? string[0].to_i : string[0].to_sym]
    self.value = @@values[string[0].to_i > 0 ? string[0].to_i : string[0]]
  end

  def to_s
    "#{self.face} of #{self.suit}"
  end
end
