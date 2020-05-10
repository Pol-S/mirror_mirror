class Spell < ApplicationRecord
  has_many :character_spells
  has_many :characters, through: :character_spells
  has_many :character_class_spells
  has_many :character_classes, through: :character_class_spells
end
