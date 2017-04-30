# This program is probably a tad over engineered. Still, crtique is welcome.

class Poker
  attr_accessor :best_hand
  def initialize(*hands)
    self.hands = hands.map {|hand| Hand.new(hand)}

    self.best_hand = hands.first > hands.last ? hands.first : hands.last
  end
end

class Rank
  attr_accessor :letter, :value, :royal
  def initialize(name, value = nil, royal = false)
    raise ArgumentError if letter != letter.to_s.to_i && !value
    self.letter = letter
    self.value = value
    self.royal = royal
  end

  def royal
    self.royal
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

  def to_s
    self.name
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
  TEN = Rank.new("10", 9, royalty = true)
  JACK = Rank.new("Jack", 10, royalty = true)
  QUEEN = Rank.new("Queen", 11, royalty = true)
  KING = Rank.new("King", 12, royalty = true)
  ACE = Rank.new("ACE", 13, royalty = true)

  LETTER_TO_RANK = {'2' => TWO, '3' => THREE, '4' => FOUR, '5' => FIVE,
                    '6' => SIX, '7' => SEVEN, '8' => EIGHT, '9' => NINE,
                    "10" => TEN, 'J' => JACK, 'Q' => QUEEN, 'K' => KING,
                    'A' => ACE}

  Suit = Struct.new(:name)

  LETTER_TO_SUIT = {'S' => Suit.new("Spades"), 'C' => Suit.new("Clubs"),
                    'H' => Suit.new("Hearts"), 'D' => Suit.new("Daimonds")}

  attr_accessor :cards, :card_strings

  def initialize(card_strings)
    self.card_strings = card_strings

    self.cards = card_strings.map do |card_string|
      rank = LETTER_TO_RANK[card_string[0...-1]]
      suit = LETTER_TO_SUIT[card_string[-1]]
      Card.new(rank, suit)
    end

    self.cards.sort!
  end

  def royal_flush?
    royal? && straight? && flush?
  end

  def royal?
    self.cards.all? {|card| card.royal?}
  end

  def straight?
    base = self.cards.first

    self.cards.each_with_index do |card, index|
      return false unless card.rank.value == base.rank.value + index
    end

    self.cards
  end

  def flush?
    suit = self.cards.first

    self.cards.all? {|card| card.suit == base.suit}
  end

  def pair?
    n_of_a_kind?(2)
  end

  def three_of_a_kind?
    n_of_a_kind?(3)
  end

  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  def full_house?
    kids = three_of_a_kind?
    return false unless kids
    remaining_cards = self.cards - kids

    parents = n_of_a_kind(2, remaining_cards)
    return false unless parents

    kids + parents
  end

  def two_pairs?
    first_pair = pair?
    return false unless first_pair
    remaining_cards = self.cards - first_pair

    second_pair = n_of_a_kind?(2, remaining_cards)
    return false unless second_pair

    first_pair + second_pair
  end

  def n_of_a_kind?(n, cards = self.cards)
    cards.permutaion.map do |permutation|
      base = permutation.first
      hand = permutation.select {|card| base.rank == card.rank} == 3
      return hand if hand.length == n
    end

    false
  end

  def highest_value_sequence
    return self.cards if royal_flush?
    return self.cards if straight_flush?
    return four_of_a_kind? if four_of_a_kind?
    return self.cards if full_house?
    return self.cards if straight?
    return three_of_a_kind? if three_of_a_kind?
    return two_pairs? if two_pairs?
    return pair? if pair?
    [self.cards.max {|a, b| a.value > b.value}]
  end

# Attempt to turn cards into point values. There are almost certainly many edge
# cases that this program does not handle because I don't understand poker that
# well. :(

  def value
    high_card_bonus = highest_value_sequence.max {|a, b| a.value > b.value}
    return 800 if royal_flush?
    return 700 if straight_flush?
    return 600 + high_card_bonus if four_of_a_kind?
    return 500 + high_card_bonus if full_house?
    return 400 + high_card_bonus if straight?
    return 300 + high_card_bonus if three_of_a_kind?
    return 200 + high_card_bonus if two_pairs?
    return 100 + high_card_bonus if pair?
    high_card_bonus
  end

  def >(other)
    value > other.value
  end

  def <(other)
    value < other.value
  end
end

class Card
  attr_accessor :rank, :suit
  def initialize(rank, suit)
    self.rank = rank
    self.suit = suit
  end

  def value
    self.rank.value
  end

  def <(other) # Is there a way to DRY this up?
    value < other.value
  end

  def >(other)
    value > other.value
  end

  # On second thought, this is ambiguous.
  # def ==(other)
  #   self.rank == other.rank
  # end

  def !=(other)
    value != other.value
  end

  def to_s
    "#{self.rank.to_s} of #{self.suit.name}"
  end
end
