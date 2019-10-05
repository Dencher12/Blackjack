class Shuffler
  def initialize
    card_names = [
      'Т♣', '2♣', '3♣', '4♣', '5♣', '6♣', '7♣', '8♣', '9♣', '10♣', 'В♣', 'Д♣', 'К♣',
      'Т♦', '2♦', '3♦', '4♦', '5♦', '6♦', '7♦', '8♦', '9♦', '10♦', 'В♦', 'Д♦', 'К♦',
      'Т♥', '2♥', '3♥', '4♥', '5♥', '6♥', '7♥', '8♥', '9♥', '10♥', 'В♥', 'Д♥', 'К♥',
      'Т♠', '2♠', '3♠', '4♠', '5♠', '6♠', '7♠', '8♠', '9♠', '10♠', 'В♠', 'Д♠', 'К♠'
    ]
    @deck = card_names.map { |card_name| Card.new(card_name) }
    shuffle
  end

  def shuffle
    @deck.shuffle!
  end

  def pull(amount)
    res = @deck[0..amount - 1]
    @deck.slice!(0..amount - 1)
    res
  end
end
