class CardsPrinter

  def self.print(car1_name, car2_name)
    spec_space1 = ''
    spec_line1 = ''
    spec_space2 = ''
    spec_line2 = ''

    if car1_name.size == 3
      spec_space1 = ' '
      spec_line1 = '_'
    end

    if car2_name.size == 3
      spec_space2 = ' '
      spec_line2 = '_'
    end

    puts ''
    puts "  ______#{spec_line1}      ______#{spec_line2}  "
    puts " |      #{spec_space1}|    |      #{spec_space2}| "
    puts " |      #{spec_space1}|    |      #{spec_space2}| "
    puts " |  #{car1_name}  |    |  #{car2_name}  | "
    puts " |      #{spec_space1}|    |      #{spec_space2}| "
    puts " |______#{spec_line1}|    |______#{spec_line2}| "
    puts ''

  end
end
