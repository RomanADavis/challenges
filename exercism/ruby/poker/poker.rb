# This program is probably a tad over engineered. It also seems hacky in
# general. Critique welcome. Looking forward to seeing other people's solutions
# and improving it after I've had a little break from this.

class Poker
  attr_accessor :hands, :best
  def initialize(hands)
    self.hands = hands.map {|hand| Hand.new(hand)}
  end

  def best_hand
    result = []
    max = 0
    self.hands.each do |hand|
      if hand.value > max
        result = [hand.card_strings]
        max = hand.value
      elsif hand.value == max
        result << hand.card_strings
      end
    end
    result
  end
end

class Rank
  attr_accessor :name, :value, :royal
  def initialize(name, value, royal = false)
    self.name = name
    self.value = value
    self.royal = royal
  end

  def royal?
    self.royal
  end

  def <(other)
    self.value < other.value
  end

  def >(other)
    self.value > other.value
  end

  def to_s
    self.name
  end
end

class Hand
  attr_accessor :cards, :card_strings

  def initialize(card_strings)
    self.card_strings = card_strings

    self.cards = card_strings.map do |card_string|
      Card.new(card_string)
    end

    self.cards.sort_by! {|a| a.value}
  end

  def royal_flush?
    royal? && straight? && flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def royal?
    self.cards.all? {|card| card.royal?}
  end

  def straight?(cards = self.cards)
    return ace_low_straight? if cards.last.rank == Card::ACE && cards == self.cards

    base = self.cards.first.rank.value

    cards.each_with_index do |card, index|
      return false unless card.rank.value == base + index
    end

    self.cards
  end

  private
  def ace_low_straight?
    return false unless self.cards.last.rank == Card::ACE

    # If it's a straight there will be only one ace at the end
    straight?(self.cards[0...-1])
  end

  public
  def flush?
    suit = self.cards.first.suit

    self.cards.all? {|card| card.suit == suit}
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

    parents = n_of_a_kind?(2, remaining_cards)
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
    return false if cards == nil || cards.empty?
    cards.permutation.map do |permutation|
      base = permutation.first.rank
      hand = permutation.select {|card| base == card.rank}
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
    [self.cards.max_by {|card| card.value}]
  end

# Attempt to turn cards into point values. There are almost certainly many edge
# cases that this program does not handle because I don't understand poker that
# well. :(

  def value
    return @value if @value

    return @value = 900                   if royal_flush?
    return @value = 800 + high_card_bonus if straight_flush?
    return @value = 700 + high_card_bonus if four_of_a_kind?
    return @value = 600 + high_card_bonus if full_house?
    return @value = 500 + high_card_bonus if flush?
    return @value = 400 + high_card_bonus if straight?
    return @value = 300 + high_card_bonus if three_of_a_kind?
    return @value = 200 + high_card_bonus if two_pairs?
    return @value = 100 + high_card_bonus if pair?
    @value = self.cards.map {|card| card.value}.inject(:+)
  end

  private
  def high_card_bonus
    high_card_bonus = highest_value_sequence.max_by {|card| card.value}.value
    high_card_bonus = 1 if high_card_bonus == 13 && straight? # 5 high straight
    high_card_bonus = three_of_a_kind?.first.value if full_house?
    high_card_bonus
  end

  public
  def >(other)
    value > other.value
  end

  def <(other)
    value < other.value
  end
end

class Card
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
  ACE = Rank.new("Ace", 13, royalty = true)

  LETTER_TO_RANK = {'2' => TWO, '3' => THREE, '4' => FOUR, '5' => FIVE,
                    '6' => SIX, '7' => SEVEN, '8' => EIGHT, '9' => NINE,
                    "10" => TEN, 'J' => JACK, 'Q' => QUEEN, 'K' => KING,
                    'A' => ACE}

  Suit = Struct.new(:name)

  LETTER_TO_SUIT = {'S' => Suit.new("Spades"), 'C' => Suit.new("Clubs"),
                    'H' => Suit.new("Hearts"), 'D' => Suit.new("Daimonds")}
  attr_accessor :rank, :suit
  def initialize(card_string)
    rank = LETTER_TO_RANK[card_string[0...-1]]
    suit_string = card_string[-1]
    suit = LETTER_TO_SUIT.fetch(suit_string) {raise ArgumentError.new("Unknown suit string #{suit_string}")}
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

  def royal?
    self.rank.royal?
  end

  def to_s
    "#{self.rank.to_s} of #{self.suit.name}"
  end
end

module BookKeeping
  VERSION = 2
end
