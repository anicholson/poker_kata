require 'ostruct'

class Hand < OpenStruct
  RANKINGS_IN_DESCENDING_ORDER = [
    :straight_flush,
    :four_of_a_kind,
    :full_house,
    :flush,
    :straight,
    :three_of_a_kind,
    :two_pair,
    :pair,
    :high_card
  ]

  def beats? other_hand
    higher_ranking_hand_than?(other_hand)
  end

  private
  def higher_ranking_hand_than?(other_hand)
    RANKINGS_IN_DESCENDING_ORDER.index(hand) < RANKINGS_IN_DESCENDING_ORDER.index(other_hand.hand)
  end
end
