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

  def self.goodbye_message #X
    @@goodbye_message
  end




  ## moved to GetAndSetPlayerInfo.rb
  # def get_player 
  #   prompt_for_name
  #   @player = Player.find_or_create_by_name(gets.chomp)
  #   @current_player = @player
  #   prompt_for_token
  #   @player.set_player_token
  # end

  def get_opponent #X
    @opponent = ComputerPlayer.new
    @other_player = @opponent#can change this to add 2 players
    #@opponent.set_computer_token(@player)
  end

  def gets_player_and_opponent #X
    binding.pry
    GetAndSetPlayerInfo.new(self).run
        #get_opponent
  end

  def switch_turns #X
    @current_player, @other_player = @other_player, @current_player
  end

  def prompt_player_for_move 
    puts "Enter a number from 1 to 9"
    move = (gets.chomp.to_i - 1)
    while !self.board.empty_square?(move) && ![0..8].include?(move)
      #repeat input process
      puts "Enter a number from 1 to 9"
      move = gets.chomp.to_i
    end

    self.player.add_move(move)
  end

  def set_move #X
    if @current_player.is_a?(Player)
      prompt_player_for_move
    elsif @current_player.is_a?(ComputerPlayer)
      move = @current_player.computer_move
      while !check_computer_move(move) 
        move = @current_player.computer_move
      end
      @current_player.moves << move
    end
  end

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

  def win_sequence
    @current_player.update_record_win
    @other_player.update_record_loss
    self.board.close_board
    self.board.print_board
    self.win_message
  end

  def tie_sequence
    @current_player.update_record_tie
    @other_player.update_record_tie
    self.board.close_board
    self.board.print_board
    tie_message
  end

  def check_for_win_or_tie
    #binding.pry
    if self.board.check_for_win 
      self.win_sequence
    elsif self.board.check_for_tie
      self.tie_sequence
    end
  end

  def one_round #X
    self.board.print_board
    self.set_move
    self.board.check_and_set_square(@current_player.moves.last, @current_player)
    self.check_for_win_or_tie
    #binding.pry
    self.switch_turns
    #binding.pry
  end

  def game_loop #X
    while game_board_status == "open"
      self.one_round
    end
  end
end


