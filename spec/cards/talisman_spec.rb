require 'spec_helper'

describe 'Talisman' do
  let(:card_name) { 'talisman' }

  describe '#play' do
    include_context 'play card'

    it 'updates the game state' do
      @subject.play_card
      @turn.reload
      expect(@turn.phase).to eq('treasure')
      expect(@turn.talismans).to eq(1)
      expect(@turn.coins).to eq(1)
    end
  end
end