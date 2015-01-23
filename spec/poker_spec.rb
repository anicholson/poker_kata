require 'spec_helper'
require 'poker'

describe Poker do
  it 'recognises high card' do
    subject = Poker.new 'KH', '3H', '4D', '5S', '9C'

    expect(subject.hand).to eq([:high_card, ['K']])
  end

  it 'recognises a pair' do
    subject = Poker.new 'AD', 'AC', '2S', '4H', '7D'

    expect(subject.hand).to eq([:pair, ['A']])

    subject = Poker.new 'AD', '7C', '2S', '4H', '7D'
    expect(subject.hand).to eq([:pair, ['7']])
  end

  it 'recognises two-pair' do
    subject = Poker.new 'AD', 'AC', '10H', '10D', 'KS'

    expect(subject.hand).to eq([:two_pair, ['A', '10']])
  end

  it 'recognises three-of-a-kind' do
    subject = Poker.new '2D', '2C', '3D', '4H', '2H'

    expect(subject.hand).to eq([:three_of_a_kind, ['2']])
  end
end