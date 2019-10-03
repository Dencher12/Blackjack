require_relative 'score_counter'
require_relative 'cards_printer'
require_relative 'shuffler'
require_relative 'dealer'

class Game
  def initialize(player)
    @player = player
    @dealer = Dealer.new

    @moves = {
      hit: -> { send(:hit) },
      stand: -> { send(:stand) },
      open: -> { send(:open) }
    }
  end

  def start
    @shuffler = Shuffler.new
    @player.cards = @shuffler.pull(2)
    @dealer.cards = @shuffler.pull(2)

    print_dealer_info
    print_player_info

    move_to_player
  end

  def print_player_info
    puts ''
    print ' Ваши карты:'
    CardsPrinter.print(@player.cards)
    puts " ОЧКИ: #{@player.score}"
    puts ''
  end

  def print_dealer_info
    puts ''
    print ' Карты дилера:'
    CardsPrinter.print(@dealer.cards, true)
    puts ''
  end

  def move_to_player
    puts "#{@player.name}, каков будет Ваш ход?"
    @moves[gets.chomp.to_sym].call
  end

  def hit
    @player.cards = @player.cards + @shuffler.pull(1)
    print_dealer_info
    print_player_info
  end
end
