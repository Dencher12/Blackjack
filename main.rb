require_relative 'player'
require_relative 'dealer'
require_relative 'game'

puts 'Добро пожаловать в Blackjack!'
puts ''
puts 'Команды:'
puts 'hit - взять карту и вызвать open'
puts 'stand - пропустить ход'
puts 'open - отрыть карты и закончить игру'
puts ''

print 'Будте добры ввести Ваше имя: '

player = Player.new(gets.chomp)
dealer = Dealer.new


Game.start(player, dealer)

loop do
  puts 'Ещё разок? (н/n - нет, остальное - да)'
  break if gets.chomp =~ /[nн]/i

  Game.start(player, dealer)
end
