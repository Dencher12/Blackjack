class Player
  attr_accessor :name, :bankroll, :cards

  def initialize(name)
    @name = name
    @bankroll = 100
    @points = 0
    @cards = []
  end

  def points
    @points = PointsCounter.count_points(cards)
    @points
  end

  def hit
    @cards += Game.shuffler.pull(1)
  end
end
