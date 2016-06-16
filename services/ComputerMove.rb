class ComputerMove
  attr_accessor :player, :board

  def initialize(player, board)
    @player = player
    @board = board
  end

  def run
    move = rand(0..8)
    while !board.empty_square?(move)
      move = rand(0..8)
    end
    player.add_move(move)
  end

end



  # def prompt_player_for_move
  #   puts "Enter a number from 1 to 9"
  #   move = gets.chomp.to_i
  #   while !((1..9).include?(move) && board.empty_square?(move - 1))
  #     puts "Enter a number from 1 to 9"
  #     move = (gets.chomp.to_i)
  #   end
  #   player.add_move(move - 1)
  #   @move = move - 1
  # end