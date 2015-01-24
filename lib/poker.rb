require_relative './card'
require_relative './poker_hand_check'
require_relative './counts_by_suit'
require_relative './counts_by_value'
require_relative './four_of_a_kind'
require_relative './full_house'
require_relative './flush'
require_relative './straight'
require_relative './straight_flush'
require_relative './three_of_a_kind'
require_relative './two_pair'
require_relative './pair'
require_relative './high_card'

class Poker
  attr_reader :cards

  HANDS_IN_DESCENDING_ORDER = [
    StraightFlush,
    FourOfAKind,
    FullHouse,
    Flush,
    Straight,
    ThreeOfAKind,
    TwoPair,
    Pair,
    HighCard
  ]

  def initialize(*cards)
    @cards = extract_cards(cards)
  end

  def hand
    best_hand.result
  end

  private

  def best_hand
    candidate_hands.detect(&:present?)
  end

  def candidate_hands
    HANDS_IN_DESCENDING_ORDER.map { |strategy| strategy.new(@cards) }
  end

  def extract_cards(cards)
    cards.map do |card_string|
      value, suit = card_string[0...-1], card_string[-1]
      Card.new(value, suit)
    end.sort
  end
end
