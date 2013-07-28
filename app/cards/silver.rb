module Silver

  def starting_count(game)
    40
  end

  def cost
    {
      coin: 3
    }
  end

  def type
    [:treasure]
  end

  def play(game)
    game.current_turn.add_coins(2)
  end

  def log(game, player)
    message = game.current_player.player_id == player.id ? 'You play' : "#{game.current_player.username} plays"
    message += " a <span class=\"#{type_class}\">Silver</span>."
  end
end
