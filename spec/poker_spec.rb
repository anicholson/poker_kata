require 'spec_helper'
require 'poker'

describe Poker do
  describe 'hand recognition' do
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

    it 'recognises a straight' do
      subject = Poker.new '5H', '4C', '3D', '2S', 'AH'

      expect(subject.hand).to eq([:straight, ['5']])

      subject = Poker.new 'AS', 'KS', 'QS', 'JS', '10H'

      expect(subject.hand).to eq([:straight, ['A']])
    end

    it 'recognises a flush' do
      subject = Poker.new 'AC', 'KC', 'QC', '5C', '2C'

      expect(subject.hand).to eq([:flush, ['A']])
    end

    it 'recognises a full house' do
      subject = Poker.new 'AH', '5S', '5H', '5D', 'AD'

      expect(subject.hand).to eq([:full_house, ['5', 'A']])
    end

    it 'recognises a four-of-a-kind' do
      subject = Poker.new '2D', '2C', '3D', '2S', '2H'

      expect(subject.hand).to eq([:four_of_a_kind, ['2']])
    end

    it 'recognises a straight flush' do
      subject = Poker.new 'AH', 'KH', 'QH', 'JH', '10H'

      expect(subject.hand).to eq([:straight_flush, ['A']])
    end
  end
end
