require_relative 'card'

class ScoreCounter
  def count_score(*card_names)
    @sum = 0
    @aces = 0
    @card_names = card_names
    count
    append_aces
    @sum
  end

  private

  def count
    @card_names.each do |card_name|
      card = Card.new(card_name)
      @sum += card.value.to_i if card.type == :num
      @sum += 10 if card.type == :img
      @aces += 1 if card.type == :ace
    end
  end

  def append_aces
    while @aces > 0
      @sum + 11 < 22 ? @sum += 11 : @sum += 1
      @aces -= 1
    end
  end
end
