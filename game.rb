require_relative 'score_counter'
require_relative 'cards_printer'
require_relative 'shuffler'

class Game
  def start(player)
    @player = player
    @dealer = nil

    shuffler = Shuffler.new
    player.cards = shuffler.pull(2)

    puts ''
    print ' Ваши карты:'
    CardsPrinter.print(player.cards)
    puts " ОЧКИ: #{player.score}"
    puts ''
  end
end
