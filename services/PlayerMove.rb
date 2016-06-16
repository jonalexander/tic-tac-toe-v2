class PlayerMove
  attr_accessor :player, :board, :move
  
  def initialize(player, board)
    @player = player
    @board = board
    @move = 99
  end

  def run
    prompt_player_for_move
  end

  def prompt_player_for_move
    puts "Enter a number from 1 to 9"
    move = gets.chomp.to_i
    while !((1..9).include?(move) && board.empty_square?(move - 1))
      puts "Enter a number from 1 to 9"
      move = (gets.chomp.to_i)
    end
    player.add_move(move - 1)
    @move = move - 1
  end
end


