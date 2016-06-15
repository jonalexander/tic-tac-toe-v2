require 'pry'
require_relative 'models/board.rb'
require_relative 'models/player.rb'
require_relative 'models/computer.rb'
require_relative 'models/game.rb'
require_relative 'services/GetAndSetPlayerInfo.rb'
require_relative 'services/SetTokens.rb'

current_game = Game.new
Game.greeting_message  
binding.pry

GetAndSetPlayerInfo.new(current_game).run

# current_info = GetAndSetPlayerInfo.new
# current_info.game = current_game
# current_info.run


#current_game.get_player_and_opponent
#current_game.game_loop
#Game.goodbye_message