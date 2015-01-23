class PokerHandCheck
  def initialize(cards = [])
    @cards = cards
  end

  def result
    @result ||= run_check
  end

  def present?
    result != :not_present
  end

  private

  attr_reader :cards

  def run_check
    raise NotImplementedError
  end
end