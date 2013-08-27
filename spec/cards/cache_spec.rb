require 'spec_helper'

describe 'Cache' do
  let(:card_name) { 'cache' }

  describe '#play' do
    include_context "play card"

    it 'updates the game state' do
      @subject.play_card
      @turn.reload
      expect(@turn.phase).to eq('treasure')
      expect(@turn.coins).to eq(3)
    end
  end

  describe '#gain' do
    include_context "gain card"

    it 'gives two coppers' do
      copper = Card.create name: 'copper'
      game_copper = GameCard.create game: @game, card: copper, remaining: 10

      @subject.gain_card('discard')
      @turn.reload
      expect(@game_player.discard.count).to eq(3)
    end
  end
end
