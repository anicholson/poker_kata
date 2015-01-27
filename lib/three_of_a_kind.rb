class ThreeOfAKind < PokerHandCheck
  private

  include CountsByValue

  def run_check
    if triple?
      Hand.new(
        hand: :three_of_a_kind,
        cards: @triple,
        suit: :NA
      )
    else
      :not_present
    end
  end

  def triple?
    @triple = cards_i_have_n_of 3
    @triple.any?
  rescue
    false
  end
end
