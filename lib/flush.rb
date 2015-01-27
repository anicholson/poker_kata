require 'set'

class Flush < PokerHandCheck
  private

  include CountsBySuit

  def run_check
    if all_cards_have_the_same_suit?
      Hand.new(
        hand: :flush,
        cards: cards,
        high_card: cards.first,
        suit: cards.first.suit
      )
    else
      :not_present
    end
  end
end
