class Player
  attr_accessor :name, :bankroll, :cards

  def initialize(name, shuffler)
    @name = name
    @bankroll = 100
    @points = 0
    @cards = []
    @shuffler = shuffler
  end

  def points
    @points = PointsCounter.count_points(cards)
    @points
  end

  def hit
    @cards += @shuffler.pull(1)
  end
end
