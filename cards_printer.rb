class CardsPrinter
  class << self
    def print(names)
      if names.size == 3
        print3(names)
        return
      end 

      syms1 = define_syms(names[0])
      syms2 = define_syms(names[1])

      puts ''
      puts "  ______#{syms1[1]}      ______#{syms2[1]}  "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}| "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}| "
      puts " |  #{names[0]}  |    |  #{names[1]}  | "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}| "
      puts " |______#{syms1[1]}|    |______#{syms2[1]}| "
      puts ''
    end

    def print3(names)
      syms1 = define_syms(names[0])
      syms2 = define_syms(names[1])
      syms3 = define_syms(names[2])

      puts ''
      puts "  ______#{syms1[1]}      ______#{syms2[1]}      ______#{syms3[1]}     "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}|    |      #{syms3[0]}|       "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}|    |      #{syms3[0]}|        "
      puts " |  #{names[0]}  |    |  #{names[1]}  |    |  #{names[2]}  |         "
      puts " |      #{syms1[0]}|    |      #{syms2[0]}|    |      #{syms3[0]}|       "
      puts " |______#{syms1[1]}|    |______#{syms2[1]}|    |______#{syms3[1]}|       "
      puts ''
    end

    def define_syms(name)
      return [' ', '_'] if name.size == 3
      return ['', ''] if name.size == 2
    end
  end
end


       

