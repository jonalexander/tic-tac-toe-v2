class CloseBoardStatus

  def initialize(board)
    @board = board
    @board.status = "closed"
  end

end