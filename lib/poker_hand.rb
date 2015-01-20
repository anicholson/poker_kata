class PokerHand
  def initialize(*cards)
    @cards = extract_cards(cards)
  end

  def hand
    if two_pair?
      two_pair
    elsif pair?
      pair
    end
  end

  private

  def extract_cards(cards)
    cards.map do |card_string|
      value, suit = card_string[0...-1], card_string[-1]
      Card.new(value, suit)
    end
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
end