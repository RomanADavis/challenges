class Hand
  attr_accessor :cards, :sets
  def initialize(card_strings)
    self.cards = card_strings.map {|string| Card.new(string)}.sort_by!(&:value)

    sets = self.cards.map do |card|
      self.cards.select {|other| card.value == other.value}
    end

    self.sets = sets.uniq.reject {|set| set.length < 2}
  end

  def win_against?(other)
    return true                 if royal_flush?      && !other.royal_flush?
    return false                if !royal_flush?     && other.royal_flush?

    return true                 if straight_flush?   && !other.straight_flush?
    return false                if !straight_flush?  && other.straight_flush?
    return highest_card?(other) if straight_flush?   && other.straight_flush?

    return true                 if four_of_a_kind?   && !other.four_of_a_kind?
    return false                if !four_of_a_kind?  && other.four_of_a_kind?
    return highest_set?(other)  if four_of_a_kind?   && other.four_of_a_kind?

    return true                 if full_house?       && !other.full_house?
    return false                if !full_house?      && other.full_house?
    return highest_set?(other)  if full_house?       && other.full_house?

    return true                 if flush?            && !other.flush?
    return false                if !flush?           && other.flush?
    return highest_card?(other) if flush?            && other.flush?

    return true                 if straight?         && !other.straight?
    return false                if !straight?        && other.straight?

    return true                 if three_of_a_kind?  && !other.three_of_a_kind?
    return false                if !three_of_a_kind? && other.three_of_a_kind?
    return highest_set?(other)  if three_of_a_kind?  && other.three_of_a_kind?

    return true                 if two_pairs?        && !other.two_pairs?
    return false                if !two_pairs?       && other.two_pairs?
    return highest_set?(other)  if two_pairs?        && other.two_pairs?

    return true                 if one_pair?         && !other.one_pair?
    return false                if !one_pair?        && other.one_pair?
    return highest_set?(other)  if one_pair?         && other.one_pair?

    highest_card?(other)
  end

  def highest_set?(other) # Basically exists to keep win_against allignment
    a, b = self.sets, other.sets

    return highest_single_set?(other) if a.length == 1 # one_pair, three_of_a_kind, four_of_a_kind
    return highest_two_pairs?(other)  if a[0].length == a[1].length # two_pairs

    greatest_house?(other) # full house
  end

  def greatest_house?(other)
    a = self.sets.map  {|set| set.map(&:value)}
    b = other.sets.map {|set| set.map(&:value)}

    a.sort_by!(&:length).reverse!
    b.sort_by!(&:length).reverse!
    return true  if a[0][0] > b[0][0]
    return false if b[0][0] > a[0][0]
    return true  if a[1][0] > b[1][0]
    false
  end

  def highest_two_pairs?(other)
    a = self.sets.map  {|set| set.map(&:value)}
    b = other.sets.map {|set| set.map(&:value)}

    a.sort_by!(&:max).reverse!
    b.sort_by!(&:max).reverse!
    return true  if a[0][0].value > b[0][0].value
    return false if b[0][0].value > a[0][0].value
    return true  if a[1][0].value > b[1][0].value
    return false if b[1][0].value > a[1][0].value
    highest_card?(other)
  end

  def highest_single_set?(other)
    a, b = self.sets[0].map(&:value), other.sets[0].map(&:value)

    return true  if a[0] > b[0]
    return false if b[0] > a[0]
    highest_card?(other)
  end

  def highest_card?(other)
    a, b = self.cards.map(&:value), other.cards.map(&:value)

    while a[-1] == b[-1]
      a = a[0...-1]
      b = b[0...-1]
    end

    a[-1] > b[-1]
  end

  def one_pair?
    self.sets.length == 1 && self.sets[0].length == 2
  end

  def two_pairs?
    self.sets.length == 2 && self.sets[0].length == self.sets[1].length
  end

  def three_of_a_kind?
    self.sets.length == 1 && self.sets[0].length == 3
  end

  def straight?
    is_incrementing = self.cards.select.with_index do |card, index|
      card.value == self.cards[0].value + index
    end

    is_incrementing.all?
  end

  def flush?
    self.cards.map(&:suit).uniq.length == 1
  end

  def full_house?
    self.sets.length == 2 && self.sets[0].length != self.sets[1].length
  end

  def four_of_a_kind?
    self.sets.length == 1 && self.sets[0].length == 4
  end

  def straight_flush?
    straight? && flush?
  end

  def royal_flush?
    straight_flush? && self.cards[-1] == 14
  end
end
