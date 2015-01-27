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
    quad_value = count_of_card_values.detect do |_value, count|
      count == 4
    end.first

    @quad = cards.select {|card| card.value == quad_value }
  rescue
    false
  end
end
