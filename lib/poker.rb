require_relative './card'
require_relative './poker_hand_check'
require_relative './counts_by_value'
require_relative './three_of_a_kind'
require_relative './two_pair'
require_relative './pair'
require_relative './high_card'

class Poker
  attr_reader :cards

  POSSIBLE_HANDS = [
    ThreeOfAKind,
    TwoPair,
    Pair,
    HighCard
  ]

  def initialize(*cards)
    @cards = extract_cards(cards)
  end

  def hand
    strategies.detect do |candidate_hand|
      candidate_hand.present?
    end.result
  end

  def strategies
    POSSIBLE_HANDS.map { |strategy| strategy.new(@cards) }
  end

  private

  def extract_cards(cards)
    cards.map do |card_string|
      value, suit = card_string[0...-1], card_string[-1]
      Card.new(value, suit)
    end.sort
  end
end