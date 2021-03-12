# Используется(require) в:
# - app.rb

require './class_Mercenaries.rb'

class NilClass
  def type
    ''
  end
end

# !!! DRY app.rb, methods_Battle.rb
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

# !!! НУЖНА ВАЛИДАЦИЯ ПОД РАЗЛИЧНУЮ ДЛИНУ НИКА
# Показ поля отярда во время его создания для одного игрока
def show_create_party_table(players, number_player = 0)
  puts ''
  puts '  ' + '=' * 59
  puts '  ||                 ||                 ||                 ||'
  puts format('  ||%12s     ||%12s     ||%12s     ||  <== Первый ряд',
              players[number_player][:mercenaries][0].type,
              players[number_player][:mercenaries][1].type,
              players[number_player][:mercenaries][2].type)
  puts '  ||                 ||                 ||                 ||'
  puts '  ' + '=' * 59
  puts '  ||                 ||                 ||                 ||'
  puts format('  ||%12s     ||%12s     ||%12s     ||  <== Второй ряд',
              players[number_player][:mercenaries][3].type,
              players[number_player][:mercenaries][4].type,
              players[number_player][:mercenaries][5].type)
  puts '  ||                 ||                 ||                 ||'
  puts '  ' + '=' * 59
  puts '  ||                 ||                 ||                 ||'
  puts format('  ||%12s     ||%12s     ||%12s     ||  <== Третий ряд',
              players[number_player][:mercenaries][6].type,
              players[number_player][:mercenaries][7].type,
              players[number_player][:mercenaries][8].type)
  puts '  ||                 ||                 ||                 ||'
  puts '  ' + '=' * 59
  puts ''
end

# Инициализация массива с 9-ю пустыми объектами
# Возвращает массив
def empty_player_arr_merc
  [nil, nil, nil, nil, nil, nil, nil, nil, nil]
end

# Присваиваем имя игроку в хек с ключём :name и помещаем его players[],
# массив player помещаем в @players[]
# Возвращает хеш вида { :name => 'abc'}
def reg_player_name
  loop do
    puts '
  Введите имя игрока (максимальная длина 11 символов): '
    menu_input

    player_name = {}
    if @input.length <= 11
      player_name[:name] = @input
      return player_name
    else
      puts 'Неудача'
    end
  end
end

# !!! NEED UPDATE
# Определяет каким игроков управлять
# Возвращает число (0 или 1) - индекс игрока из массива игроков
def which_player
  loop do
    puts '
  Каким игроком управлять (1 | 2 | (E)xit)?'
    menu_input

    case @input
    when '1'
      return 0
    when '2'
      return 1
    when 'E'
      raise 'pressed EXIT' # !!! СПОРНО
    else
      puts 'Введите одно из значений, указанных выше!'
    end
  end
end

# !!! NEED REFACTORING
# Стоит подумать что лучше (1..9) или (1.1, 1.2, ... 3.3 (ряд.столбец))
# Определяем какую позицию изменить
# Возвращает число
def what_position
  loop do
    puts '
  Какую позицию изменить (от 1 до 9 | (E)xit)?'
    menu_input

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

# Принимает:
#   - Массив одного игрока, какого именно, определяется в
#     цикле loop метода create_party
#   - Позицию наёмника из метода what_position
# Возвращает переменную @input
def menu_list_management_party(player, pos)
  if player[:mercenaries][pos - 1].nil? # Если ячейка ещё не занята, то подразумевается, что возвращаем '1'
    @input = '1'
  else
    loop do
      puts "
  Что сделать с позицией № #{pos}? (1 | 2 | 3 | (E)xit)
      Меню:
      1. Поставить/Поменять наёмника
      2. Переместить наёмника"
      menu_input

      case @input
      when '1'
        return
      when '2'
        return
      when 'E'
        raise 'pressed EXIT' # !!! СПОРНО
      else
        puts 'Введите одно из значений, указанных выше!'
      end
    end
  end
end

# Инициализируем пустые массивы маёмников для игрока/игроков
# Возвращает массив игроков
def assigning_arr_merc_players(players)
  if players.size == 1
    players[0][:mercenaries] = empty_player_arr_merc
  elsif players.size == 2
    players[0][:mercenaries] = empty_player_arr_merc
    players[1][:mercenaries] = empty_player_arr_merc
  end
  players
end

# !!! NEED REFACTORING
# Определяем какого неёмника добавить
# Возвращаем число (Integer)
def which_merc
  loop do
    puts "
  Какого наёмника (1 | 2 | ... | 15 | (E)xit) ?

  Type:   Sword         Axe          Spear         Bow           Cannon             Gun           Staff
  ================|============|=============|============|==================|===============|============
      1. Swordman | 4. Viking  | 6. Spearman | 8. Archer  | 10. Artilleryman | 12. Gunner    | 14. Healer
      2. Guard    | 5. Trainer | 7. Sparta   | 9. Prophet | 11. Cannoneer    | 13. Janissary | 15. Monk
      3. Exorcist |"
    menu_input

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
    when '10'
      return 10
    when '11'
      return 11
    when '12'
      return 12
    when '13'
      return 13
    when '14'
      return 14
    when '15'
      return 15
    when 'E'
      raise 'pressed EXIT' # !!! СПОРНО
    else
      puts 'Введите одно из значений, указанных выше!'
    end
  end
end

# Добавляем наёмника в отряд на выбранную ранее позицию
# Возвращает массив игрока
def add_merc_field(player, position, mercenary)
  case mercenary
  when 1
    player[:mercenaries][position - 1] = Mercenaries.create_swordman
  when 2
    player[:mercenaries][position - 1] = Mercenaries.create_guard
  when 3
    player[:mercenaries][position - 1] = Mercenaries.create_exorcist
  when 4
    player[:mercenaries][position - 1] = Mercenaries.create_viking
  when 5
    player[:mercenaries][position - 1] = Mercenaries.create_trainer
  when 6
    player[:mercenaries][position - 1] = Mercenaries.create_spearman
  when 7
    player[:mercenaries][position - 1] = Mercenaries.create_spartan
  when 8
    player[:mercenaries][position - 1] = Mercenaries.create_archer
  when 9
    player[:mercenaries][position - 1] = Mercenaries.create_prophet
  when 10
    player[:mercenaries][position - 1] = Mercenaries.create_artilleryman
  when 11
    player[:mercenaries][position - 1] = Mercenaries.create_cannoneer
  when 12
    player[:mercenaries][position - 1] = Mercenaries.create_gunner
  when 13
    player[:mercenaries][position - 1] = Mercenaries.create_janissary
  when 14
    player[:mercenaries][position - 1] = Mercenaries.create_healer
  when 15
    player[:mercenaries][position - 1] = Mercenaries.create_monk
  end
  player
end

# !!! NEED REFACTORING
# Стоит подумать что лучше (1..9) или (1.1, 1.2, ... 3.3 (ряд.столбец))
# Определяем на какую позицию переместить
# Возвращает число
def where_move
  loop do
    puts '  На какую позицию переместить (от 1 до 9 | (E)xit)?'
    menu_input

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

# Меняем местами наёмников
# Возвращает массив игрока
def switch_merc_pos(player, first_position, second_position)
  player[:mercenaries][first_position - 1], player[:mercenaries][second_position - 1] = player[:mercenaries][second_position - 1], player[:mercenaries][first_position - 1]
  player
end

# Спрашиваем игрока, начать ли игру
# Возвращает true/false
def start_battle?
  loop do
    puts '
    Отряд собран. Началь игру? (Y/N)'
    menu_input

    if @input == 'Y' || @input == 'y'
      return true
    elsif @input == 'N' || @input == 'n'
      return false
    else
      puts 'Введите одно из значений, указанных выше!'
    end
  end
end

# Принимает массив с игроками(хеши)
# По умолчю подразумевается что управляем 1 игроком
# Используется индекс(0,1) игрока, а не его нумерация(1,2)
# Возвращает массив игроков
def create_party(players)
  loop do |number_player = 0| # Цикл настройки отряда
    # Для одного игрока, спрашиваем начать ли игру, если массив отряда не содержит пустые элементы
    if players.size == 1 && players[0][:mercenaries].include?(nil) == false
      return @players if start_battle? == true
    end

    # Для двух игрокщв, спрашиваем начать ли игру, если массив отряда не содержит пустые элементы
    if players.size == 2 && players[0][:mercenaries].include?(nil) == false && players[1][:mercenaries].include?(nil) == false
      return @players if start_battle? == true
    end

    number_player = which_player if players.size == 2 # Спрашивает каким игроком управлять, если играют два игрока

    show_create_party_table(players, number_player) # Показ поля отряда

    position = what_position # Сохраняем в переменной выбранную позицию (INTEGER), НЕ ИНДЕКС!
    menu_list_management_party(players[number_player], position)

    case @input
    when '1'
      add_merc_field(players[number_player], position, which_merc)
    when '2'
      switch_merc_pos(players[number_player], position, where_move)
    end
  end
end

# Задаем хеш, содержащий параметры( :name, :turn, :turn_qt)
# Возвращаем хеш
def init_player_params
  player = reg_player_name
  player[:turn] = false
  player[:turn_qt] = 0
  player
end

# =============================TEST======================================
def test_empty_player_arr_merc
  [Mercenaries.create_swordman, Mercenaries.create_swordman, Mercenaries.create_swordman,
   Mercenaries.create_archer, Mercenaries.create_prophet, Mercenaries.create_gunner,
   Mercenaries.create_healer, Mercenaries.create_monk, Mercenaries.create_exorcist]
end

def test_init_players_params(players)
  if players.size == 1
    players[0][:turn] = false # Добавляем пару возможности хода
    players[0][:turn_qt] = 0 # Добавляем пару кол-во уже совершенных ходов
    players[0][:mercenaries] = test_empty_player_arr_merc
  elsif players.size == 2
    players[0][:turn] = false
    players[0][:turn_qt] = 0
    players[0][:mercenaries] = test_empty_player_arr_merc
    players[1][:turn] = false
    players[1][:turn_qt] = 0
    players[1][:mercenaries] = test_empty_player_arr_merc
  end
  players
end
# ==============================================================================
