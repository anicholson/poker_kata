class ThreeOfAKind < PokerHandCheck
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

  private

  def triple
    count_of_card_values.detect do |value, count|
      count == 3
    end.first

  rescue
    false
  end

  include CountsByValue
end