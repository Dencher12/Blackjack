require_relative 'player'
require_relative 'score_counter'
require_relative 'cards_printer'

puts 'Добро пожаловать в Blackjack!'
print 'Будте добры ввести Ваше имя: '

player = Player.new(gets.chomp)

puts "Превосходно, #{player.name}, у вас есть #{player.money}$"
puts 'Ваша цель - стать БОГАТЫМ, а если Вы уже БОГАТЫ, то ещё БОГАЧЕ!!!'

c = ScoreCounter.new
puts c.count_score('10♥', '10♥')
CardsPrinter.print('10♥', '2♥')
