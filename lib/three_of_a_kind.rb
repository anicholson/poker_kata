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
    triple_value = count_of_card_values.detect do |_value, count|
      count == 3
    end.first

    @triple = cards.select {|card| card.value == triple_value }
  rescue
    false
  end
end
