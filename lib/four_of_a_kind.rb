class FourOfAKind < PokerHandCheck
  private

  include CountsByValue

  def run_check
    if quad?
      Hand.new(
        hand: :four_of_a_kind,
        cards: @quad,
        suit: :NA
      )
    else
      :not_present
    end
  end

  def quad?
    @quad = cards_i_have_n_of 4
    @quad.any?
  rescue
    false
  end
end
