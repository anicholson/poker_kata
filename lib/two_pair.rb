class TwoPair < PokerHandCheck
  private

  def run_check
    if pairs.count == 2
      [
        :two_pair,
        pairs
      ]
    else
      :not_present
    end
  end

  def pairs
    count_of_card_values.select{|value, count| count == 2}.map(&:first)
  end

  private

  include CountsByValue
end