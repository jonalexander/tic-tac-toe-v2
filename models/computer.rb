
class ComputerPlayer
  attr_accessor :name, :token, :record, :moves

  def initialize(name = "Computer")
    @name = name
    @token = ""
    @record = {:wins => 0, :losses => 0, :ties => 0}
    @moves = []
  end

  def computer_move
    move = rand(0..8)
  end

  def add_move(move)
    @moves << move
  end

end

