class Dealer < Player
  def initialize(shuffler)
    super('Dealer', shuffler)
  end

  def make_move
    'stand'
  end
end
