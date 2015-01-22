class Card < Struct.new(:value, :suit)
  RANKING = ['A', 'K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2', 'A']

  def <=>(other)
    if other.is_a? Card
      RANKING.index(value) <=> RANKING.index(other.value)
    else
      value <=> other
    end
  end
end

class HighCard
  def self.run(cards)
    [
      :high_card,
      [cards.first.value]
    ]
  end
end

class Pair
  def self.run(cards)
    if self.pair_found?(cards)
      [
        :pair,
        [@pair]
      ]
    end
  end

  def self.pair_found?(cards)
    return false if cards.length < 2

    if pair? *cards.take(2)
      @pair = cards.first.value
      return true
    else
      cards.shift
      pair_found?(cards)
    end
  end

  def self.pair?(a, b = Card.new)
    a.value == b.value
  end
end

class ThreeOfAKind
  def self.run(cards)

  end
end

class PokerHand
  def initialize(*cards)
    @cards = extract_cards(cards)
  end

  def hand
    if two_pair?
      two_pair
    elsif pair?
      pair
    else
      high_card
    end
  end

  private

  def extract_cards(cards)
    cards.map do |card_string|
      value, suit = card_string[0...-1], card_string[-1]
      Card.new(value, suit)
    end.sort
  end

  class Card < Struct.new(:value, :suit); end

  def two_pair?
    pair? && pairs.count == 2
  end

  def pair?
    @point_value_groups ||= @cards.reduce(Hash.new(0)) do |h, card|
      h[card.value] += 1
      h
    end

    @point_value_groups.any? {|value, count| count == 2 }
  end

  def pair
    [ :pair,
      [pairs.first[0]]
    ]
  end

  def pairs
    @point_value_groups.select { |value, count| count == 2 }
  end

  def two_pair
    [
      :two_pair,
      pairs.map {|value, _| value }
    ]
  end

  def high_card
    ranking =  @cards.sort do |a, b|
      a = RANKING.index(a.value)
      b = RANKING.index(b.value)

      return -1 if a.nil?
      return  1 if b.nil?
      a <=> b
    end
    [:high_card, [ranking.first.value]]
  end
end