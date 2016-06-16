class SwitchTurns

  attr_accessor :game

  def initialize(game)
    @game = game
  end

  def run
    @game.current_player, @game.other_player = @game.other_player, @game.current_player
  end

end
