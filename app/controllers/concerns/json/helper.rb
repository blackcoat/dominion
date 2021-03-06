module Json::Helper

  def is_current_player?(player)
    current_player.id == player.id
  end

  def same_player?(player1, player2)
    player1.id == player2.id
  end

  def common_cards(game)
    turn = game.current_turn
    game_cards(game, 'victory') + game_cards(game, 'treasure') + game.miscellaneous_cards.collect{ |card| card.json(game, turn) }
  end

  def game_cards(game, type)
    turn = game.current_turn
    sort_cards(game, turn, game.send("#{type}_cards")).collect{ |card| card.json(game, turn) }
  end

  def sort_cards(game, turn, cards)
    turn = game.current_turn
    cards.sort{ |a, b| b.calculated_cost(game, turn)[:coin] <=> a.calculated_cost(game, turn)[:coin] }
  end

  def grouped_cards(cards)
    grouped_cards = cards.group_by { |card| card.name }
    grouped_cards.map{ |name, card_group|
      {
        name: name,
        count: card_group.count,
        card_id: card_group.first.card_id
      }
    }
  end

  def chat_json(player, message)
    json = {
      action: 'chat',
      message: "<strong>#{player.username}:</strong> #{message}"
    }.to_json
  end

end
