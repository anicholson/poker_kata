class HighCard < PokerHandCheck
  def run_check
    Hand.new(
      hand:   :high_card,
      cards:  [cards.first],
      suit:   :NA,
      kicker: cards[1..-1]
    )
  end
end
