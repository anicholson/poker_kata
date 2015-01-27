require 'spec_helper'
require 'hand'

TYPES_OF_HAND = [:straight_flush, :four_of_a_kind, :full_house,
:flush, :straight, :three_of_a_kind, :two_pair, :pair, :high_card ]

describe Hand do
  describe 'beats?' do
    TYPES_OF_HAND.each do |type_of_hand|
      context type_of_hand do
        let(:this_hand) { Hand.new hand: type_of_hand }

        TYPES_OF_HAND.each do |other_hand|
          if TYPES_OF_HAND.index(other_hand) > TYPES_OF_HAND.index(type_of_hand)
            it "beats #{other_hand}" do
              expect(this_hand.beats?(Hand.new(hand: other_hand))).to eq(true)
            end
          elsif TYPES_OF_HAND.index(other_hand) < TYPES_OF_HAND.index(type_of_hand)
            it "loses to #{other_hand}" do
              expect(this_hand.beats?(Hand.new(hand: other_hand))).to eq(false)
            end
          end
        end
      end
    end
  end
end