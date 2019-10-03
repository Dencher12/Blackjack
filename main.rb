require_relative 'player'
require_relative 'game'

puts 'Добро пожаловать в Blackjack!'
print 'Будте добры ввести Ваше имя: '

player = Player.new(gets.chomp)

puts "Превосходно, #{player.name}, у вас есть #{player.bankroll}$"
puts 'Ваша цель - стать БОГАТЫМ, а если Вы уже БОГАТЫ, то ещё БОГАЧЕ!!!'

game = Game.new(player)
game.start

loop do
  puts 'Ещё разок? (н/n - нет, остальное - да)'
  break if gets.chomp =~ /[nн]/i

  game.start
end
