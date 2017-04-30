class Poker
  attr_accessor :best_hand
  def initialize(*hands)
    self.best_hand = hands.max
  end
end

class Hand
  TWO = Rank.new('2', 1)
  THREE = Rank.new('3', 2)
  FOUR = Rank.new('4', 3)
  FIVE = Rank.new('5', 4)
  SIX = Rank.new('6', 5)
  SEVEN = Rank.new('7', 6)
  EIGHT = Rank.new('8', 7)
  NINE = Rank.new('9', 8)
  TEN = Rank.new("10", 9)
  JACK = Rank.new("Jack", 10)
  QUEEN = Rank.new("Queen", 11)
  KING = Rank.new("King", 12)
  ACE = Rank.new("ACE", 13)

  LETTER_TO_RANK = {'2' => TWO, '3' => THREE, '4' => FOUR, '5' => FIVE,
                    '6' => SIX, '7' => SEVEN, '8' => EIGHT, '9' => NINE,
                    "10" => TEN, 'J' => JACK, 'Q' => QUEEN, 'K' => KING,
                    'A' => ACE}

  Suit = Struct.new(:name)

  LETTER_TO_SUIT = {'S' => Suit.new("Spades"), 'C' => Suit.new("Clubs"),
                    'H' => Suit.new("Hearts"), 'D' => Suit.new("Daimonds")}

  attr_accessor :cards

  def initialize(card_strings)
    self.cards = card_strings.map do |card_string|
      rank = LETTER_TO_RANK[card_string[0...-1])]
      suit = LETTER_TO_SUIT[card_string[-1]]
      Card.new(rank, suit)
    end
  end

  def value
  end
end

class Card
  attr_accessor :rank, :suit
  def initialize(rank, suit)
    self.rank = rank
    @suit = suit
  end

  def value
    self.rank.value
  end

  def <(other) # Is there a way to DRY this up?
    self.rank < other.rank
  end

  def >(other)
    self.rank > other.rank
  end

  def ==(other)
    self.rank == other.rank
  end

  def !=(other)
    self.rank != other.rank
  end
end

class Rank
  attr_accessor :letter, :value
  def initialize(letter, value = nil)
    raise ArgumentError if letter != letter.to_s.to_i && !value
    self.letter = letter
    self.value = value
  end

  def <(other)
    self.value < other.value
  end

  def >(other)
    self.value > other.value
  end

  def ==(other)
    self.value == other.value
  end

  def !=(other)
    !(self == other)
  end
end
