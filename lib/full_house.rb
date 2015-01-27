class FullHouse < PokerHandCheck
  private

  include CountsByValue

  def run_check
    if triple? && pair?
      Hand.new(
        hand: :full_house,
        suit: :NA,
        triple: @triple,
        pair: @pair
      )
    else
      :not_present
    end
  end

  def triple?
    @triple = count_of_card_values.detect do |_value, count|
      count == 3
    end.first
  rescue
    false
  end

  def pair?
    @pair = count_of_card_values.detect do |_value, count|
      count == 2
    end.first
  rescue
    false
  end
end
