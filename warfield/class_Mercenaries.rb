# Используется(require) в:
# - app.rb
# - methods_Players.rb
# - methods_AI.rb
# - field.rb

class Mercenaries
  # Мечник
  def self.create_swordman
    Mercenaries.new('Sword', 'Swordman', 150, 10, 10, 10, rand(80..95), false, 0, false, false)
  end

  # Защитник
  def self.create_guard
    Mercenaries.new('Sword', 'Guard', 180, 9, 12, 9, rand(75..101), false, 0, false, false)
  end

  # Экзорцист
  def self.create_exorcist
    Mercenaries.new('Sword', 'Exorcist', 110, 8, 7, 11, rand(85..99), false, 0, false, false)
  end

  # Викинг
  def self.create_viking
    Mercenaries.new('Axe', 'Viking', 190, 7, 9, 7, rand(65..79), false, 0, false, false)
  end

  # Дрессировщица
  def self.create_trainer
    Mercenaries.new('Axe', 'Trainer', 140, 8, 9, 9, rand(75..85), false, 0, false, false)
  end

  # Копейщик
  def self.create_spearman
    Mercenaries.new('Spear', 'Spearman', 135, 11, 7, 11, rand(80..105), false, 0, false, false)
  end

  # Спартанец
  def self.create_spartan
    Mercenaries.new('Spear', 'Spartan', 170, 12, 8, 9, rand(75..95), false, 0, false, false)
  end

  # Лучница
  def self.create_archer
    Mercenaries.new('Bow', 'Archer', 85, 14, 6, 12, rand(90..110), false, 0, false, false)
  end

  # Пророк
  def self.create_prophet
    Mercenaries.new('Bow', 'Prophet', 95, 12, 5, 10, rand(80..90), false, 0, false, false)
  end

  # Артиллерист
  def self.create_artilleryman
    Mercenaries.new('Cannon', 'Artilleryman', 85, 7, 6, 8, rand(70..95), false, 0, false, false)
  end

  # Канонир
  def self.create_cannoneer
    Mercenaries.new('Cannon', 'Cannoneer', 90, 7, 8, 7, rand(70..90), false, 0, false, false)
  end

  # Стрелок
  def self.create_gunner
    Mercenaries.new('Gun', 'Gunner', 90, 8, 6, 10, rand(75..90), false, 0, false, false)
  end

  # Янычар
  def self.create_janissary
    Mercenaries.new('Gun', 'Janissary', 90, 8, 8, 9, rand(70..90), false, 0, false, false)
  end

  # Хилер
  def self.create_healer
    Mercenaries.new('Staff', 'Healer', 80, 6, 6, 10, rand(75..90), false, 0, false, false)
  end

  # Монах
  def self.create_monk
    Mercenaries.new('Staff', 'Monk', 80, 6, 6, 9, rand(70..85), false, 0, false, false)
  end

  attr_accessor :type_weapon, :type, :hp, :damage, :armor, :iniative,
                :available_iniative, :stun, :stun_qt, :freeze, :turn

  def initialize(type_weapon, type, hp, damage, armor, iniative, available_iniative, stun, stun_qt, freeze, turn)
    self.type_weapon = type_weapon
    self.type = type
    self.hp = hp
    self.damage = damage
    self.armor = armor
    self.iniative = iniative
    self.available_iniative = available_iniative
    self.stun = stun
    self.stun_qt = stun_qt
    self.freeze = freeze
    self.turn = turn
  end
end
