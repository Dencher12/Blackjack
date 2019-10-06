require_relative 'points_counter'
require_relative 'cards_printer'
require_relative 'shuffler'
require_relative 'dealer'
require_relative 'player'

class Game
  @shuffler = Shuffler.new
  class << self
    attr_accessor :shuffler

    def start(player, dealer)
      @player = player
      @dealer = dealer

      shuffler = Shuffler.new

      @player.cards = shuffler.pull(2)
      @dealer.cards = shuffler.pull(2)

      @player.bankroll -= 10
      @dealer.bankroll -= 10

      print_info
      move_to_player
    end

    def print_player_info()
      puts ''
      print ' Ваши карты:'
      CardsPrinter.print(@player.cards)
      puts " ОЧКИ: #{@player.points}"
      puts ''
    end

    def print_dealer_info(hidden)
      puts ''
      print ' Карты дилера:'
      CardsPrinter.print(@dealer.cards, hidden)
      puts " ОЧКИ: #{@dealer.points}" unless hidden
      puts ''
    end

    def print_info(hidden = true)
      print_dealer_info(hidden)
      print_player_info
    end

    private

    def move_to_player
      puts "Ставка 10$, у Вас #{@player.bankroll}$"
      puts "#{@player.name}, каков будет Ваш ход?"
      move = gets.chomp
      raise 'Неизвестная команда' if move !~ /hit|stand|open/

      player_hit if move == 'hit'
      open if move == 'open'
      move_to_dealer if move == 'stand'
    rescue StandardError => e
      puts e.message
      retry
    end

    def move_to_dealer
      move = @dealer.make_move
      dealer_hit if move == 'hit'
      move_to_player
    end

    def player_hit
      @player.hit
      open
    end

    def dealer_hit
      return if @dealer.cards.size > 2

      @dealer.hit
      print_info
    end

    def open
      pp = @player.points
      dp = @dealer.points

      print_info(false)
      if (pp > dp || dp > 21) && pp <= 21
        puts "Вы выйграли! У Вас #{@player.bankroll += 20}$"
      elsif dp > 21 || dp == pp
        puts 'Ничья!'
      else
        @dealer.bankroll += 20
        puts "Вы проиграли! У Вас #{@player.bankroll}$"
      end
    end
  end
end
