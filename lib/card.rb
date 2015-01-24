class Card < Struct.new(:value, :suit)
  RANKING = ['A', 'K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2']

  def <=>(other)
    if other.is_a? Card
      ranking <=> other.ranking
    else
      value <=> other
    end
  end

  def ranking
    RANKING.index(value)
  end
end