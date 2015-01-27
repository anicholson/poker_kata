class TwoPair < PokerHandCheck
  private

  include CountsByValue

  def run_check
    if pairs?
      Hand.new(
        hand: :two_pair,
        cards: @pairs,
        suit: :NA
      )
    else
      :not_present
    end
  end

  def pairs?
    pair_values = count_of_card_values.select do |_value, count|
      count == 2
    end.map(&:first)

    if pair_values.count == 2
      @pairs = cards.select {|card| pair_values.include? card.value }
    end
  end
end
