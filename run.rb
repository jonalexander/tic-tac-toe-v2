require 'pry'
require_relative 'models/board.rb'
require_relative 'models/player.rb'
require_relative 'models/computer.rb'
require_relative 'models/game.rb'
require_relative 'services/GetAndSetPlayerInfo.rb'
require_relative 'services/SetTokens.rb'
require_relative 'services/PlayerMove.rb'
require_relative 'services/UpdateBoard.rb'
require_relative 'services/UpdateRecord.rb'
require_relative 'services/CloseBoardStatus.rb'
require_relative 'services/SwitchTurns.rb'
require_relative 'services/ComputerMove.rb'
require_relative 'services/ClearBoard.rb'

class TicTacToe

  attr_accessor :game, :player, :board 

  def initialize
  end 

  def run
    create_game
    set_players
  end

  def self.create_game
    @game = Game.new
    @player = @game.current_player
    @board = Board.new
    #Game.greeting_message  
  end

self.create_game 
self.set_players

# current_game = @game
# current_player = current_game.player
GetAndSetPlayerInfo.new(@game).run
@board.print_board

# run_status = "open"

# while run_status == "open"s

  while board.status == "open"

  if current_game.current_player.is_a?(Player)
    move1 = PlayerMove.new(current_game.current_player, board)
    move1.run
    UpdateBoard.new(current_game.current_player, board, move1.move).run
  elsif current_game.current_player.is_a?(ComputerPlayer)
    move2 = ComputerMove.new(current_game.current_player, board)
    move2.run
    UpdateBoard.new(current_game.current_player, board, current_game.current_player.moves.last).run
  end
  #sleep(2)
  board.print_board

  if board.check_for_win
    update_win = UpdateRecord.new(current_game.current_player)
    update_win.win
    update_loss = UpdateRecord.new(current_game.other_player)
    update_loss.loss
    #CloseBoardStatus.new(board)
    board.print_board
    current_game.win_message
    clear_board = ClearBoard.new(board)
    clear_board.run
    CloseBoardStatus.new(board) #if !self.play_again?
  elsif board.check_for_tie
    update_tie_current_player = UpdateRecord.new(current_game.current_player)
    update_tie_current_player.tie
    update_tie_other_player= UpdateRecord.new(current_game.other_player)
    update_tie_other_player.tie
    #CloseBoardStatus.new(board)
    board.print_board
    current_game.tie_message
    clear_board = ClearBoard.new(board)
    clear_board.run
    CloseBoardStatus.new(board) #if !self.play_again? 
  end

  switch = SwitchTurns.new(current_game)
  switch.run
  end #closes board.status loop

end #class Tic Tac Toe
