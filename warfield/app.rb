require './field.rb'
require './methods_Players.rb'
require './methods_AI.rb'
require './methods_Battle.rb'
require './class_Mercenaries.rb'

# Шапка приветствия
def show_game_head
  puts "
                     Добро пожаловать в
                          WARFIELD
"
end

# !!! DRY app.rb
# Показает пользователю строку ввода,
# если строка пустая, то повторяет до ввода любого значения
# Возвращает строку в переменной @input
def menu_input
  loop do
    @input = ''
    print 'Ввод=> '
    @input = gets.to_s.chomp
    break if @input != ''
  end
end

# Основное меню
# Возвращает переменную @input
def menu_list
  loop do
    puts '
    Меню:
    1. 1 игрок
    2. 2 игрока
    3. Руководство
    4. Выход
    5. TEST 1 player
    6. TEST 2 players'
    menu_input

    if @input == '1' || @input == '2' || @input == '3' || @input == '5' || @input == '6'
      return
    elsif @input == '4'
      raise 'EXIT'
    else
      puts 'Введите одно из значений, указанных выше!'
    end
  end
end

# Выводит на экран переменную liens, содержащую все строки из файла Guide.txt
def show_guide
  lines = []
  File.open('Guide.txt') { |file| lines = file.readlines }
  puts lines
end

# --------------------- ОСНОВНОЕ ТЕЛО ПРОГРАММЫ --------------------
# Показ приветствия и вывод стартового меню
show_game_head
menu_list

# Игрок выбирает один из пунктов меню и перенаправляется в соответствующий метод
case @input
when '1'
  @players = []

  @players << init_player_params
  @players = assigning_arr_merc_players(@players) # Инициализируем пустые массивы маёмников для игрока
  create_party(@players)
  @players << create_ai_name_and_party(rand(6)) # Добавляем в массив игроков имя и отряд AI соперника, один из ранее описанных в методе

  battle(@players)
when '2'
  @players = []
  @players << init_player_params
  @players << init_player_params
  @players = assigning_arr_merc_players(@players) # Инициализируем пустые массивы маёмников для игроков
  create_party(@players)

  battle(@players)
when '3'
  show_guide
when '5' # Тестовая ветвь
  @players = []
  @players << { name: 'TEST_player' } # Сохраняем в массиве @players игрока(хеш)
  @players = test_init_players_params(@players) # Инициализируем массивив маёмников для игрока

  @players << create_ai_name_and_party(rand(6)) # Добавляем в массив игроков имя и отряд AI соперника, один из ранее описанных в методе

  battle(@players)
when '6' # Тестовая ветвь
  @players = []
  @players << { name: 'TEST_player_1' } # Сохраняем в массиве @players игрокa №1(хеш)
  @players << { name: 'TEST_player_2' } # Сохраняем в массиве @players игрокa №2(хеш)
  @players = test_init_players_params(@players) # Инициализируем массивы маёмников для игроков

  show_field(@players)
end
