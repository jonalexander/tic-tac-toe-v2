#SetTokens.new(player, gets.strip)

class SetTokens
  attr_accessor :player, :computer, :token_input

  def initialize(player, computer, token_input)
    @player = player
    @computer = computer
    @token_input = token_input
  end

  def run
    player.token = token_input
    set_computer_token
  end

  def set_computer_token
    player.token == "X" ? computer.token = "O" : computer.token = "X"
  end

end