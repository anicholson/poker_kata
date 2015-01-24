class StraightFlush < Straight
  private

  include CountsBySuit

  def run_check
    if straight? && all_cards_have_the_same_suit?
      [
        :straight_flush,
        [high_card.value]
      ]
    else
      :not_present
    end
  end
end
