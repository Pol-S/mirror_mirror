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

  #calculate characer nuke spell scores
  def nuke_calc
    if spells.length > 0
      score = spells.reduce(0) do |rating, spell|
        rating += spell[:nuker_score]
      end
    else
      score = 0
    end
  end

  def cc_calc
    if spells.length > 0
      score = spells.reduce(0) do |rating, spell|
        rating += spell[:cc_score]
      end
    else
      score = 0
    end
  end

  def utility_calc
    if spells.length > 0
      score = spells.reduce(0) do |rating, spell|
        rating += spell[:utility_score]
      end
    else
      score = 0
    end
  end

  def face_calc
    if spells.length > 0
      score = spells.reduce(0) do |rating, spell|
        rating += spell[:face_score]
      end
    else
      score = 0
    end
  end
end
