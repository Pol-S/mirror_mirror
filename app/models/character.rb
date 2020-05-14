class Character < ApplicationRecord
  belongs_to :user
  has_many :character_spells
  has_many :spells, through: :character_spells
  belongs_to :character_class

  def add_spell(spell_id)
    @newcharacterspell = CharacterSpell.new({ spell_id: spell_id, character_id: id })
    class_compliant = false

    if CharacterClassSpell.where(character_class_id: id, spell_id: spell_id).first
      @newcharacterspell.save
    else
      "spell not saved"
    end
  end

  #calculate characer
  def score_calc
  end
end
