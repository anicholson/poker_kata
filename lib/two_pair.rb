class TwoPair < PokerHandCheck
  private

  include CountsByValue

  def run_check
    if pairs?
      [
        :two_pair,
        @pairs
      ]
    else
      :not_present
    end
  end

  def pairs?
    @pairs = count_of_card_values.select do |_value, count|
      count == 2
    end.map(&:first)

    @pairs.count == 2
  end
end
