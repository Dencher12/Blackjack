class Dealer < Player
  def initialize(shuffler)
    super('Dealer', shuffler)
  end

  def make_move
    safe_cards = @shuffler.deck.count do |card|
      (points + card.points) <= 21
    end
    success_prob = (safe_cards.to_f / @shuffler.deck.size) > 0.5
    puts safe_cards.to_f / @shuffler.deck.size
    puts success_prob
    @shuffler.deck.each {|c| puts c.name}
    success_prob ? 'hit' : 'stand'
  end
end
