class CharacterClass < ApplicationRecord
  has_many :characters
  has_many :character_class_spells
end
