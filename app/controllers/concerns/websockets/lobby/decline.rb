module Websockets::Lobby::Decline

  def decline_game(data)
    if Game.exists? data['game_id']
      game = Game.find data['game_id']
      game_players = game.players
      game.destroy

      game_players.each do |player|
        player.update_attribute(:current_game, nil)
        ApplicationController.lobby[player.id].send_data({
          action: 'decline',
          decliner: current_player,
          is_decliner: current_player.id == player.id
        }.to_json) if ApplicationController.lobby[player.id]
      end
      refresh_lobby
    end
  end

end