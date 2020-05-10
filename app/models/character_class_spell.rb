class CharacterClassSpell < ApplicationRecord
  belongs_to :character_class
  belongs_to :spell
end
