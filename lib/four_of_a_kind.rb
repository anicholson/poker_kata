class FourOfAKind < PokerHandCheck
  private

  include CountsByValue

  def run_check
    if quad?
      [
        :four_of_a_kind,
        [@quad]
      ]
    else
      :not_present
    end
  end

  def quad?
    @quad = count_of_card_values.detect do |_value, count|
      count == 4
    end.first
  rescue
    false
  end
end
