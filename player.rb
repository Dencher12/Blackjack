class Player
  attr_accessor :name, :bankroll, :cards

  def initialize(name)
    @name = name
    @bankroll = 100
    @score = 0
    @cards = []
  end

  def score
    @score = ScoreCounter.count_score(cards)
    @score
  end
end
