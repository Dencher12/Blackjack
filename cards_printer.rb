class CardsPrinter
  class << self
    def print(cards, hidden = false)
      cards.map! { |card| card.gsub(/./, '*') } if hidden == true
      if cards.size == 3
        print3(cards)
        return
      end

      syms1 = define_syms(cards[0])
      syms2 = define_syms(cards[1])

      puts ''
      puts "  ______#{syms1[1]}      ______#{syms2[1]}  "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}| "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}| "
      puts " |  #{cards[0]}  |    |  #{cards[1]}  | "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}| "
      puts " |______#{syms1[1]}|    |______#{syms2[1]}| "
      puts ''
    end

    def print3(cards)
      syms1 = define_syms(cards[0])
      syms2 = define_syms(cards[1])
      syms3 = define_syms(cards[2])

      puts ''
      puts "  ______#{syms1[1]}      ______#{syms2[1]}      ______#{syms3[1]}     "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}|    |      #{syms3[0]}|       "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}|    |      #{syms3[0]}|        "
      puts " |  #{cards[0]}  |    |  #{cards[1]}  |    |  #{cards[2]}  |         "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}|    |      #{syms3[0]}|       "
      puts " |______#{syms1[1]}|    |______#{syms2[1]}|    |______#{syms3[1]}|       "
      puts ''
    end

    def define_syms(card)
      return [' ', '_'] if card.size == 3
      return ['', ''] if card.size == 2
    end
  end
end
