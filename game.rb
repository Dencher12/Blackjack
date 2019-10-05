require_relative 'points_counter'
require_relative 'cards_printer'
require_relative 'shuffler'
require_relative 'dealer'

class Game
  def initialize(player, dealer)
    @player = player
    @dealer = dealer

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
    puts "#{@player.name}, каков будет Ваш ход?"
    move = gets.chomp
    raise 'Неизвестная команда' if move !~ /hit|stand|open/

    hit(@player) if move == 'hit'
    if move == 'open'
      open
      return
    end

    move_to_dealer
  rescue StandardError => e
    puts e.message
    retry
  end

  def move_to_dealer
    move = @dealer.make_move
    hit(@dealer) if move == 'hit'
    move_to_player
  end

  def hit(member)
    member.hit
    print_info
  end

  def open
    print_info(false)
    if @player.points > @dealer.points && @player.points <= 21
      puts 'Вы выйграли!'
    elsif @dealer.points > 21
      puts 'Ничья!'
    else
      puts 'Вы проиграли!'
    end
  end
end
