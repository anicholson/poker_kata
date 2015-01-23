require_relative './card'

class PokerHandCheck
  def initialize(cards = [])
    @cards = cards
  end

  def result
    @result ||= run_check
  end

  def present?
    result != :not_present
  end

  private

  def run_check
    raise NotImplementedError
  end
end

class HighCard < PokerHandCheck
  def run_check
    [
      :high_card,
      [@cards.first.value]
    ]
  end
end

class Pair < PokerHandCheck
  def run_check
    if pair_found?(@cards.dup)
      [
        :pair,
        [@pair]
      ]
    else
      :not_present
    end
  end

  private

  def pair_found?(cards)
    return false if cards.length < 2

    if pair? *cards.take(2)
      @pair = cards.first.value
      return true
    else
      cards.shift
      pair_found?(cards)
    end
  end

  def pair?(a, b = Card.new)
    a.value == b.value
  end
end


class Poker
  attr_reader :cards

  POSSIBLE_HANDS = [
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