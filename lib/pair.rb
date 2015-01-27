class Pair < PokerHandCheck
  private

  include CountsByValue

  def run_check
    if pair?
      Hand.new(
        hand: :pair,
        cards: @pair,
        suit: :NA
      )
    else
      :not_present
    end
  end

  def pair?
    @pair = cards_i_have_n_of(2)
    @pair.any?
  rescue
    false
  end
end
