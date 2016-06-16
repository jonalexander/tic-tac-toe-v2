class UpdateBoard
  attr_accessor :player, :board, :move

  def initialize(player, board, move)
    @player = player
    @board = board
    @move = move
  end

  def run
    ##position = player.moves.last
    board.board[@move] = player.token
  end

end