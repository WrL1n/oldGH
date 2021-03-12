# !!! DRY app.rb, methods_Players.rb
# Показает пользователю строку ввода,
# если строка пустая, то повторяет до ввода любого значения
# Возвращает строку в переменной @input
def menu_input
  loop do
    @input = ''
    print 'Ввод=>
    '
    @input = gets.to_s.chomp
    break if @input != ''
  end
end

# !!! NEED REFACTORING
# Определяем на какую позицию переместить
# Возвращает число
def where_move_merc_in_battle(player, index_turning_merc)
  loop do
    puts "  Переместиться с позиции #{index_turning_merc + 1} на ..(от 1 до 9 | (E)xit)?"
    menu_input

    if @input.to_i == index_turning_merc + 1 # Проверяем, не находится ли мерк уже на этой позиции
      puts '  Наёмник уже находится на этой позиции, введите другое значение!'
    else
      case @input
      when '1'
        return 1
      when '2'
        return 2
      when '3'
        return 3
      when '4'
        return 4
      when '5'
        return 5
      when '6'
        return 6
      when '7'
        return 7
      when '8'
        return 8
      when '9'
        return 9
      when 'E'
        raise 'pressed EXIT' # !!! СПОРНО
      else
        puts 'Введите одно из значений, указанных выше!'
      end
    end
  end
end

# Реализация защиты (плюс 1 защиты, минус 50 инициативы)
# Принимает Объект класса Mercenaries
# Возвращает Объект класса Mercenaries
def defence(merc)
  merc.available_iniative -= 50
  merc.armor += 1
  merc.turn = false
  merc
end

# Реализация пропуска хода (характеристики не изменяются)
# Принимает Объект класса Mercenaries
# Возвращает Объект класса Mercenaries
def skip_turn(merc)
  merc.turn = false
  merc
end

# Реализация перемещения наемника в бою
# Принимает хещ игрока, индекс ходящего наемника
# Возвращает хеш игрока
def movement(player, index_turning_merc)
  index_where_move = where_move_merc_in_battle(player, index_turning_merc)
  player[:mercenaries][index_turning_merc].turn = false

  player[:mercenaries][index_turning_merc], player[:mercenaries][index_where_move - 1] = player[:mercenaries][index_where_move - 1], player[:mercenaries][index_turning_merc]
  player
end
