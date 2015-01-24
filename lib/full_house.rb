class FullHouse < PokerHandCheck
  private

  include CountsByValue

  def run_check
    if triple? && pair?
      [
        :full_house,
        [@triple, @pair]
      ]
    else
      :not_present
    end
  end

  def triple?
    @triple = count_of_card_values.detect do |value, count|
      count == 3
    end.first
  rescue
    false
  end

  def pair?
    @pair = count_of_card_values.detect do |value, count|
      count == 2
    end.first
  rescue
    false
  end
end