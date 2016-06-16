require 'pry'

class Game
  attr_accessor :player, :computer_opponent, :board, :current_player, :other_player

  @@greeting_message = 'Welcome, the instruction to Tic-Tac-Toe are as followed: 
  To answer please use 1-9, which corresponds to a space of 
  the board.'
  @@goodbye_message = "Thank you for playing!"
  
  def initialize #X
    @board = Board.new
    @player = nil
    @computer_opponent = nil
    @current_player = nil
    @other_player = nil
  end

  def self.greeting_message #X
     @@greeting_message
  end

  # def self.goodbye_message #X
  #   @@goodbye_message
  # end

  def check_computer_move(move) #X
    self.board.empty_square?(move)
  end

  def win_message #X
    puts "#{@current_player.name} has won!"
  end

  def tie_message #X
    puts "Tie Game!"
  end

  def game_board_status #X
    @board.status  #=> open or closed
  end
end

