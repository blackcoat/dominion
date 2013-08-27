require 'spec_helper'

describe 'Copper' do
  let(:card_name) { 'copper' }

  include_context "play card"

  describe '#play' do
    it 'updates the game state' do
      @subject.play_card
      @turn.reload
      expect(@turn.phase).to eq('treasure')
      expect(@turn.coins).to eq(1)
    end
  end
end