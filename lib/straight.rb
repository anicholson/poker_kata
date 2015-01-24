require 'set'

class Straight < PokerHandCheck
  private

  include CountsByValue

  def run_check
    if straight?
      [
        :straight,
        [@high_card.value]
      ]
    else
      :not_present
    end
  end

  def straight?
    return false unless all_different_values?

    if ace_low_straight?
      @high_card = cards[1]
    elsif all_have_adjacent_values?
      @high_card = cards.first
    else
      false
    end
  end

  def all_have_adjacent_values?
    cards.each_cons(2).map do |this_card, next_card|
      this_card.ranking - next_card.ranking == -1
    end.all?
  end

  def all_different_values?
    count_of_card_values.none? {|value, count| count > 1 }
  end

  def any_ace?
    cards.any? {|card| card.value == 'A' }
  end

  def ace_low_straight?
    ace_low_straight = Set.new(%w[5 4 3 2 A])
    my_card_values   = Set.new(cards.map(&:value))

    ace_low_straight == my_card_values
  end
end