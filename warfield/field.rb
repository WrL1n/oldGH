# Используется(require) в:
# - app.rb

require './class_Mercenaries.rb'

# !!! ЗАМЕНИТЬ HP на MP после реализации
# ПОЛЕ 59х25 (шырина - высота). Внутренная ячейка 17x7.
# Длина всей строки 59
# В параметрах принимает массив players
def show_field(players)
  puts ''
  print ' ' * 24
  print format('%11s', players[1][:name])
  puts ' ' * 24
  puts ''
  puts '  ' + '=' * 59
  show_block(players[1], 8, 7, 6)
  puts '  ' + '=' * 59
  show_block(players[1], 5, 4, 3)
  puts '  ' + '=' * 59
  show_block(players[1], 2, 1, 0)
  puts '  ' + '=' * 59

  puts ''
  puts format('                %11s VS %0.11s                 ', players[1][:name], players[0][:name])
  puts ''

  puts '  ' + '=' * 59
  show_block(players[0], 0, 1, 2)
  puts '  ' + '=' * 59
  show_block(players[0], 3, 4, 5)
  puts '  ' + '=' * 59
  show_block(players[0], 6, 7, 8)
  puts '  ' + '=' * 59
  puts ''
  print ' ' * 24
  print format('%11s', players[0][:name])
  puts ' ' * 24
  puts ''
end

# Отрисовка одного ряда поля битвы
def show_block(player, x, y, z)
  puts format('  ||  %12s   ||  %12s   ||  %12s   ||',
            player[:mercenaries][x].type,
            player[:mercenaries][y].type,
            player[:mercenaries][z].type)
  puts '  ||                 ||                 ||                 ||'
  puts format('  ||HP:%3i     %1s:Turn||HP:%3i     %1s:Turn||HP:%3i     %1s:Turn||',
            player[:mercenaries][x].hp, replacement_image_turn(player, x),
            player[:mercenaries][y].hp, replacement_image_turn(player, y),
            player[:mercenaries][z].hp, replacement_image_turn(player, z))
  puts format('  ||MP:%3i           ||MP:%3i           ||MP:%3i           ||',
            player[:mercenaries][x].hp, # !!! ЗАМЕНИТЬ HP на MP после реализации изображения
            player[:mercenaries][y].hp, # !!! ЗАМЕНИТЬ HP на MP после реализации изображения
            player[:mercenaries][z].hp) # !!! ЗАМЕНИТЬ HP на MP после реализации изображения
  puts format('  ||In:%3i     %1s:Stun||In:%3i     %1s:Stun||In:%3i     %1s:Stun||',
            player[:mercenaries][x].available_iniative, replacement_image_stun(player, x),
            player[:mercenaries][y].available_iniative, replacement_image_stun(player, y),
            player[:mercenaries][z].available_iniative, replacement_image_stun(player, z))
  puts format('  ||     %5s:Freeze||     %5s:Freeze||     %5s:Freeze||',
            replacement_image_freeze(player, x),
            replacement_image_freeze(player, y),
            replacement_image_freeze(player, z))
  puts format('  ||       %1i:stun_lvl||       %1i:stun_lvl||       %1i:stun_lvl||',
            player[:mercenaries][x].stun_qt,
            player[:mercenaries][y].stun_qt,
            player[:mercenaries][z].stun_qt)
end

# Отображаем 'N'(No)/'Y'(Yes) вместо false/true для свойсва turn объекта наемника
def replacement_image_turn(player, merc_number)
  case player[:mercenaries][merc_number].turn
  when false
    'N'
  when true
    'Y'
  end
end

# Отображаем 'N'(No)/'Y'(Yes) вместо false/true для свойсва stun объекта наемника
def replacement_image_stun(player, merc_number)
  case player[:mercenaries][merc_number].stun
  when false
    'N'
  when true
    'Y'
  end
end

# Отображаем 'N'(No)/'Y'(Yes) вместо false/true для свойсва freeze объекта наемника
def replacement_image_freeze(player, merc_number)
  case player[:mercenaries][merc_number].freeze
  when false
    'N'
  when true
    'Y'
  end
end
