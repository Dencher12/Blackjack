class CardsPrinter
  class << self
    def print(cards, hidden = false)
      card_names = cards.map { |card| card.name.gsub(/./, '*') } if hidden
      card_names = cards.map { |card| card.name } if card_names.nil?
      if cards.size == 3
        print3(card_names)
        return
      end

      syms1 = define_syms(card_names[0])
      syms2 = define_syms(card_names[1])

      puts ''
      puts "  ______#{syms1[1]}      ______#{syms2[1]}  "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}| "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}| "
      puts " |  #{card_names[0]}  |    |  #{card_names[1]}  | "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}| "
      puts " |______#{syms1[1]}|    |______#{syms2[1]}| "
      puts ''
    end

    def print3(card_names)
      syms1 = define_syms(card_names[0])
      syms2 = define_syms(card_names[1])
      syms3 = define_syms(card_names[2])

      puts ''
      puts "  ______#{syms1[1]}      ______#{syms2[1]}      ______#{syms3[1]}  "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}|    |      #{syms3[0]}| "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}|    |      #{syms3[0]}| "
      puts " |  #{card_names[0]}  |    |  #{card_names[1]}  |    |  #{card_names[2]}  |       "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}|    |      #{syms3[0]}| "
      puts " |______#{syms1[1]}|    |______#{syms2[1]}|    |______#{syms3[1]}| "
      puts ''
    end

    def define_syms(card_name)
      return [' ', '_'] if card_name.size == 3
      return ['', ''] if card_name.size == 2
    end
  end
end
