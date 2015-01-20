require 'spec_helper'
require 'poker_hand'

describe PokerHand do
  it 'recognises high card' do
    subject = PokerHand.new 'KH', '3H', '4D', '5S', '9C'

    expect(subject.hand).to eq([:high_card, ['K']])
  end

  it 'recognises a pair' do
    subject = PokerHand.new 'AD', 'AC', '2S', '4H', '7D'

    expect(subject.hand).to eq([:pair, ['A']])

    subject = PokerHand.new 'AD', '7C', '2S', '4H', '7D'
    expect(subject.hand).to eq([:pair, ['7']])
  end

  it 'recognises two-pair' do
    subject = PokerHand.new 'AD', 'AC', '10H', '10D', 'KS'

    expect(subject.hand).to eq([:two_pair, ['A', '10']])
  end
end