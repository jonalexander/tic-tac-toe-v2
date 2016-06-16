class ClearBoard

  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def run
    board_array = @board.board
    board_array.clear
  end

end