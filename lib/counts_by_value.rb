module CountsByValue
  def count_of_card_values
    cards.each_with_object({}) do |card, counter|
      counter[card.value] ||= 0
      counter[card.value]  += 1
    end
  end

  def cards_i_have_n_of(n)
    values = count_of_card_values.select do |_value, count|
      count == n
    end.map(&:first)

    cards.select { |card| values.include?(card.value) }
  end
end
