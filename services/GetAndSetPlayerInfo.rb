require 'pry'

class GetAndSetPlayerInfo

  attr_accessor :game, :computer

  def initialize(game)
    @game = game
    game.computer_opponent = ComputerPlayer.new
    @computer = game.computer_opponent
    game.other_player = @computer
  end

  def prompt_for_name
    puts "Enter name: "
  end

  def prompt_for_token #X
    puts "X or O?"
  end

  def run 
    prompt_for_name
    player = Player.find_or_create_by_name(gets.strip)
    game.current_player = player
    prompt_for_token
    SetTokens.new(player, computer, gets.strip).run
  end
end