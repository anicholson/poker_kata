class Card < Struct.new(:value, :suit)
  RANKING = ['A', 'K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2', 'A']

  def <=>(other)
    if other.is_a? Card
      RANKING.index(value) <=> RANKING.index(other.value)
    else
      value <=> other
    end
  end
end