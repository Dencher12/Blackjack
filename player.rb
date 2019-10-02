class Player
  attr_accessor :name, :money, :cards

  def initialize(name)
    @name = name
    @money = 100
    @score = 0
    @cards = []
  end

  def score
    @score = ScoreCounter.count_score(cards)
    @score
  end  
end