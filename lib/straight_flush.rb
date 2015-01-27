class StraightFlush < Straight
  private

  include CountsBySuit

  def run_check
    if straight? && all_cards_have_the_same_suit?
      Hand.new(
        hand: :straight_flush,
        suit: cards.first.suit,
        high_card: high_card,
        cards: cards
      )
    else
      :not_present
    end
  end
end
