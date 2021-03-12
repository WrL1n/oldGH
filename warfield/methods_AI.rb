# Используется(require) в:
# - app.rb

require './class_Mercenaries.rb'

# Создаем хеш, содержащий имя и отряд AI
def create_ai_name_and_party(party_number)
  case party_number
  when 0
    { name: 'AI_0',
      turn: false,
      turn_qt: 0,
      mercenaries: [Mercenaries.create_spearman,     # ========================
                    Mercenaries.create_spartan,      #  spear   sparta   spear
                    Mercenaries.create_spearman,     #  viking  prophet exorcist
                    Mercenaries.create_viking,       #  healer   monk    arta
                    Mercenaries.create_prophet,      # ========================
                    Mercenaries.create_exorcist,
                    Mercenaries.create_healer,
                    Mercenaries.create_monk,
                    Mercenaries.create_artilleryman] }
  when 1
    { name: 'AI_1',
      turn: false,
      turn_qt: 0,
      mercenaries: [Mercenaries.create_swordman,       # ========================
                    Mercenaries.create_guard,          #  sword   guard  sword
                    Mercenaries.create_swordman,       #  viking janiss exorcist
                    Mercenaries.create_viking,         #  healer  monk  cannoneer
                    Mercenaries.create_janissary,      # ========================
                    Mercenaries.create_exorcist,
                    Mercenaries.create_healer,
                    Mercenaries.create_monk,
                    Mercenaries.create_cannoneer] }
  when 2
    { name: 'AI_2',
      turn: false,
      turn_qt: 0,
      mercenaries: [Mercenaries.create_viking,         # ==============================
                    Mercenaries.create_guard,          #   viking     guard   exorcist
                    Mercenaries.create_exorcist,       #  cannoneer  prophet   monk
                    Mercenaries.create_cannoneer,      #   healer     monk    janiss
                    Mercenaries.create_prophet,        # ==============================
                    Mercenaries.create_monk,
                    Mercenaries.create_healer,
                    Mercenaries.create_monk,
                    Mercenaries.create_janissary] }
  when 3
    { name: 'AI_3',
      turn: false,
      turn_qt: 0,
      mercenaries: [Mercenaries.create_trainer,      # ===========================
                    Mercenaries.create_trainer,      #  trainer   trainer  viking
                    Mercenaries.create_viking,       #  exorcist  archer    arta
                    Mercenaries.create_exorcist,     #  janiss    monk     healer
                    Mercenaries.create_archer,       # ===========================
                    Mercenaries.create_artilleryman,
                    Mercenaries.create_janissary,
                    Mercenaries.create_monk,
                    Mercenaries.create_healer] }
  when 4
    { name: 'AI_4',
      turn: false,
      turn_qt: 0,
      mercenaries: [Mercenaries.create_exorcist,      # ===========================
                    Mercenaries.create_spartan,       #  exorcist  sparta  viking
                    Mercenaries.create_viking,        # cannoneer  janiss  gunner
                    Mercenaries.create_cannoneer,     #  prophet    monk   healer
                    Mercenaries.create_janissary,     # ==========================
                    Mercenaries.create_gunner,
                    Mercenaries.create_prophet,
                    Mercenaries.create_monk,
                    Mercenaries.create_healer] }
  when 5
    { name: 'AI_5',
      turn: false,
      turn_qt: 0,
      mercenaries: [Mercenaries.create_guard,       # ===========================
                    Mercenaries.create_guard,       #  guard   guard   sparta
                    Mercenaries.create_spartan,     #  archer  janiss  gunner
                    Mercenaries.create_archer,      #  healer  monk   healer
                    Mercenaries.create_janissary,   # ==========================
                    Mercenaries.create_gunner,
                    Mercenaries.create_healer,
                    Mercenaries.create_monk,
                    Mercenaries.create_healer] }
  end
end

# def init_arr_merc_first_row
#   [Mercenaries.create_swordman,
#    Mercenaries.create_guard,
#    Mercenaries.create_exorcist,
#    Mercenaries.create_viking,
#    Mercenaries.create_trainer,
#    Mercenaries.create_spearman,
#    Mercenaries.create_spartan]
# end

# def init_arr_merc_second_row
#   [Mercenaries.create_archer,
#    Mercenaries.create_prophet,
#    Mercenaries.create_artilleryman,
#    Mercenaries.create_cannoneer,
#    Mercenaries.create_gunner,
#    Mercenaries.create_janissary]
# end

# def init_arr_merc_third_row
#   [Mercenaries.create_healer,
#    Mercenaries.create_monk]
# end
