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

class Run

  attr_accessor :run_status

 def initialize
  @run_status = "open"
 end 

  def self.play_again?
    puts 'Do you want to play again? Yes or No'
    answer = gets.upcase.chomp
    if answer == "YES"
      @run_status = "open"

    else
      @run_status = "closed"
    end
  end

current_game = Game.new
player = current_game.current_player
Game.greeting_message  

board = Board.new
GetAndSetPlayerInfo.new(current_game).run
board.print_board

run_status = "open"

while run_status == "open"

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
    CloseBoardStatus.new(board) if !self.play_again? 
  elsif board.check_for_tie
    update_tie_current_player = UpdateRecord.new(current_game.current_player)
    update_tie_current_player.tie
    update_tie_other_player= UpdateRecord.new(current_game.other_player)
    update_tie_other_player.tie
    #CloseBoardStatus.new(board)
    board.print_board
    current_game.tie_message
    CloseBoardStatus.new(board) if !self.play_again? 
  end

  switch = SwitchTurns.new(current_game)
  switch.run
  end
end
end #class
