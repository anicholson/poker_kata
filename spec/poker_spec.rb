require 'spec_helper'
require 'poker'

describe Poker do
  describe 'hand recognition' do
    it 'recognises high card', focus: true do
      subject = Poker.new('KH', '3H', '4D', '5S', '9C').hand

      expect(subject.hand).to eq(:high_card)
      expect(subject.cards).to include(Card.new('K', 'H'))
      expect(subject.cards.count).to eq(1)
      expect(subject.suit).to eq(:NA)
    end

    it 'recognises a pair' do
      subject = Poker.new('AD', '7C', '2S', '4H', '7D').hand

      expect(subject.hand).to eq(:pair)
      expect(subject.cards).to include(Card.new('7', 'D'))
      expect(subject.cards).to include(Card.new('7', 'C'))
    end

    it 'recognises two-pair' do
      subject = Poker.new('AD', 'AC', '10H', '10D', 'KS').hand

      expect(subject.hand).to  eq(:two_pair)
      expect(subject.suit).to  eq(:NA)
      expect(subject.cards).to include(Card.new('A', 'D'))
      expect(subject.cards).to include(Card.new('A', 'C'))
      expect(subject.cards).to include(Card.new('10', 'D'))
      expect(subject.cards).to include(Card.new('10', 'H'))
    end

    it 'recognises three-of-a-kind' do
      subject = Poker.new('2D', '2C', '3D', '4H', '2H').hand

      expect(subject.hand).to  eq(:three_of_a_kind)
      expect(subject.suit).to  eq(:NA)
      expect(subject.cards).to include(Card.new('2', 'D'))
      expect(subject.cards).to include(Card.new('2', 'H'))
      expect(subject.cards).to include(Card.new('2', 'C'))
    end

    it 'recognises a straight' do
      subject = Poker.new('5H', '4C', '3D', '2S', 'AH').hand

      expect(subject.hand).to eq(:straight)
      expect(subject.suit).to eq(:NA)
      expect(subject.cards).to include(Card.new('5', 'H'))
      expect(subject.cards).to include(Card.new('4', 'C'))
      expect(subject.cards).to include(Card.new('3', 'D'))
      expect(subject.cards).to include(Card.new('2', 'S'))
      expect(subject.cards).to include(Card.new('A', 'H'))

      expect(subject.high_card).to eq(Card.new('5', 'H'))


      subject = Poker.new('AS', 'KS', 'QS', 'JS', '10H').hand

      expect(subject.hand).to eq(:straight)
      expect(subject.suit).to eq(:NA)
      expect(subject.cards).to include(Card.new('A',  'S'))
      expect(subject.cards).to include(Card.new('K',  'S'))
      expect(subject.cards).to include(Card.new('Q',  'S'))
      expect(subject.cards).to include(Card.new('J',  'S'))
      expect(subject.cards).to include(Card.new('10', 'H'))

      expect(subject.high_card).to eq(Card.new('A', 'S'))
    end

    it 'recognises a flush' do
      subject = Poker.new('AC', 'KC', 'QC', '5C', '2C').hand

      expect(subject.hand).to eq(:flush)
      expect(subject.suit).to eq('C')
      expect(subject.high_card).to eq(Card.new('A', 'C'))


      expect(subject.cards).to include(Card.new('A', 'C'))
      expect(subject.cards).to include(Card.new('K', 'C'))
      expect(subject.cards).to include(Card.new('Q', 'C'))
      expect(subject.cards).to include(Card.new('5', 'C'))
      expect(subject.cards).to include(Card.new('2', 'C'))

    end

    it 'recognises a full house' do
      subject = Poker.new('AH', '5S', '5H', '5D', 'AD').hand

      expect(subject.hand).to eq(:full_house)
      expect(subject.suit).to eq(:NA)
      expect(subject.triple).to eq('5')
      expect(subject.pair).to eq('A')
    end

    it 'recognises a four-of-a-kind' do
      subject = Poker.new('2D', '2C', '3D', '2S', '2H').hand

      expect(subject.hand).to eq(:four_of_a_kind)
      expect(subject.cards).to     include(Card.new('2', 'D'))
      expect(subject.cards).to     include(Card.new('2', 'C'))
      expect(subject.cards).to     include(Card.new('2', 'S'))
      expect(subject.cards).to     include(Card.new('2', 'H'))
      expect(subject.cards).not_to include(Card.new('3', 'D'))
    end

    it 'recognises a straight flush' do
      subject = Poker.new('AH', 'KH', 'QH', 'JH', '10H').hand

      expect(subject.hand).to eq(:straight_flush)
      expect(subject.high_card).to eq(Card.new('A', 'H'))

    end
  end
end
