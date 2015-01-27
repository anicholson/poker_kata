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
    pair_value = count_of_card_values.detect do |_value, count|
      count == 2
    end.first

    @pair = cards.select {|card| card.value == pair_value }
  rescue
    false
  end
end
