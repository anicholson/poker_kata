module CountsByValue
  def count_of_card_values
    cards.each_with_object({}) do |card, counter|
      counter[card.value] ||= 0
      counter[card.value]  += 1
    end
  end
end