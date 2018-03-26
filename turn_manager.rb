
class Turn_manager
  def initialize(players)
  # players.dup makes a copy so the original isn't affected
    @players = players.shuffle

  end
  def current_player
    @players.first
  end

  def next_turn
    @players.rotate!
  end

end
