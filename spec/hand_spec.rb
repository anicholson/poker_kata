require 'spec_helper'
require 'hand'

describe Hand do
  describe 'interface' do
    [:hand, :suit, :cards, :kicker].each do |method|
      it { is_expected.to respond_to method }
    end
  end
end