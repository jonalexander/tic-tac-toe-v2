class CloseBoardStatus

  attr_accessor :board

  def initialize(board)
    @board = board
    @board.status = "closed"
  end

end