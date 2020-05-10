class Character < ApplicationRecord
  belongs_to :user
  has_many :character_spells
  has_many :spells, through: :character_spells
  belongs_to :character_class
end
