class Pair < PokerHandCheck
  private

  include CountsByValue

  def run_check
    if pair?
      [
        :pair,
        [@pair]
      ]
    else
      :not_present
    end
  end

  def pair?
    @pair = count_of_card_values.detect do |_value, count|
      count == 2
    end.first
  rescue
    false
  end
end