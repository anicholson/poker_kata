class Pair < PokerHandCheck
  def run_check
    if pair_found?(@cards.dup)
      [
        :pair,
        [@pair]
      ]
    else
      :not_present
    end
  end

  private

  def pair_found?(cards)
    return false if cards.length < 2

    if pair? *cards.take(2)
      @pair = cards.first.value
      return true
    else
      cards.shift
      pair_found?(cards)
    end
  end

  def pair?(a, b = Card.new)
    a.value == b.value
  end
end