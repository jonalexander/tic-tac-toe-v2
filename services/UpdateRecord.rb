class UpdateRecord
  attr_accessor :player

  def initialize(player)
    @player = player
  end


  def win
    player.record[:wins] += 1
  end

  def loss
    player.record[:losses] += 1
  end

  def tie
    player.record[:ties] += 1
  end



end
