module CountsBySuit
  def count_of_card_suits
    cards.each_with_object({}) do |card, counter|
      counter[card.suit] ||= 0
      counter[card.suit]  += 1
    end
  end

  def all_cards_have_the_same_suit?
    count_of_card_suits.count == 1
  end
end