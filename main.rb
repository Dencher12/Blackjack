require_relative 'player'

puts 'Добро пожаловать в Blackjack!'
print 'Будте добры ввести Ваше имя: '

player = Player.new(gets.chomp)

puts "Превосходно, #{player.name}, у вас есть #{player.money}$"
puts 'Ваша цель - стать БОГАТЫМ, а если Вы уже БОГАТЫ, то ещё БОГАЧЕ!!!'


