require_relative 'points_counter'
class Dealer < Player
  def initialize
    super('Dealer')
  end

  def make_move
    shuffler = Game.shuffler
    safe_cards = shuffler.deck.count do |card|
      PointsCounter.count_points(cards + [card]) <= 21
    end
    success_prob = (safe_cards.to_f / shuffler.deck.size) > 0.5
    success_prob ? 'hit' : 'stand'
  end
end
