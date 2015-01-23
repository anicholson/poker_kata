class HighCard < PokerHandCheck
  def run_check
    [
      :high_card,
      [cards.first.value]
    ]
  end
end