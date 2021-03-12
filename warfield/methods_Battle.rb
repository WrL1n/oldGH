require './field.rb'
require './class_Mercenaries.rb'
require './methods_Mercenaries.rb'

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

# Определяет кто ходит первый (подбрасывается монетка)
# Возвращает число (0 или 1)
def who_has_first_turn
  rand(2)
end

# Получает хеш одного из игроков
# Возвращает Integer
# def menu_choice_merc_for_turn(player)
#   puts "
#     Каким наемником управлять ?"
#   player[:mercenaries].each do |merc, i|
#     puts "#{i + 1}. #{merc.type}  [#{merc.type_weapon}, #{merc.iniative}]" if merc.turn == true
#   end
# end

# Определяем какой из наемников имеет наибольшую стартовую инициативу
# Принимает хеш игрока
# Возвращаем Integer - индекс наемника из массива значений ключа :mercenaries
def define_merc_with_max_iniative(player)
  arr_mercs_iniative = []
  player[:mercenaries].each do |merc|
    arr_mercs_iniative << merc.available_iniative
  end
  arr_mercs_iniative.index { |x| x == arr_mercs_iniative.max }
end

# Определяем, какое действие будет выполнять наемник
# Принимает хеш игрока и индекс ходящего наемника
# Возвращаем Integer
def menu_choice_actions_for_merc(player, index_turning_merc)
  puts "
    Наемник #{player[:mercenaries][index_turning_merc].type} игрока #{player[:name]} ходит
    Выберите действие(от 1 до 5):
      1. Атака
      2. Защита
      3. Использовать магию
      4. Переместиться
      5. Пропустить ход"
  menu_input

  if @input == '1' || @input == '2' || @input == '3' || @input == '4' || @input == '5'
    return @input.to_i
  else
    puts 'Введите одно из значений, указанных выше!'
  end
end

# Первый ход
# Принимает массив игроков, индекс ходящего игрока, индекс игрока, который сейчас не ходит
def first_turn(players, turning_player, not_turning_player)
  index_turning_merc = define_merc_with_max_iniative(players[turning_player])
  players[turning_player][:mercenaries][index_turning_merc].turn = true

  case menu_choice_actions_for_merc(players[turning_player], index_turning_merc)
  # when 1

  when 2
    defence(players[turning_player][:mercenaries][index_turning_merc])
  # when 3

  when 4
    movement(players[turning_player], index_turning_merc)
  when 5
    skip_turn(players[turning_player][:mercenaries][index_turning_merc])
  end
end

# Принимает массив игроков, индекс ходящего игрока, индекс игрока, который сейчас не ходит
# def turn(players, turning_player, not_turning_player)
#   puts "  #{players[turning_player][:name]} ходит"
#   menu_choice_merc_for_turn(players[turning_player]) # Вывод меню выбора, каким наемником управлять
# end

# Получает массив игроков
def battle(players)
  players[who_has_first_turn][:turn] = true # Присваиваем одному из игроков(рандомно) право первого хода

  show_field(players) # Показ поля битвы

  if players[0][:turn] == true
    first_turn(players, 0, 1)
  elsif players[1][:turn] == true
    first_turn(players, 1, 0)
  end

  # loop do
    # show_field(players) # Показ поля битвы

    # if players[0][:turn] == true
    #   turn(players, 0, 1)
    # elsif players[1][:turn] == true
    #   turn(players, 1, 0)
    # end
  # end
end
