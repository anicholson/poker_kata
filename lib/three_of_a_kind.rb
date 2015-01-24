class ThreeOfAKind < PokerHandCheck
  private

  include CountsByValue

  def run_check
    if triple
      [
        :three_of_a_kind,
        [triple]
      ]
    else
      :not_present
    end
  end

  def triple
    count_of_card_values.detect do |_value, count|
      count == 3
    end.first

  rescue
    false
  end
end
