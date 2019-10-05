require_relative 'card'

class PointsCounter
  class << self
    def count_points(card)
      @sum = 0
      @aces = 0
      @cards = card
      count
      append_aces
      @sum
    end

    private

    def count
      @cards.each do |card|
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
end
