require 'set'

class Flush < PokerHandCheck
  private

  def run_check
    if all_cards_have_the_same_suit?
      [
        :flush,
        [cards.first.value]
      ]
    else
      :not_present
    end
  end

  def all_cards_have_the_same_suit?
    Set.new(cards.map(&:suit)).count == 1
  end
end