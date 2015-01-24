require 'set'

class Flush < PokerHandCheck
  private

  include CountsBySuit

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
end
