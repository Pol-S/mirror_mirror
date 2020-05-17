class Character < ApplicationRecord
  belongs_to :user
  has_many :character_spells
  has_many :spells, through: :character_spells
  belongs_to :character_class

  def add_spell(spell_id)
    @newcharacterspell = CharacterSpell.new({ spell_id: spell_id, character_id: id })

    if CharacterClassSpell.where(character_class_id: character_class_id, spell_id: spell_id).first && !CharacterSpell.where(character_id: id, spell_id: spell_id).first
      @newcharacterspell.save
      "Spell added!"
    else
      false
    end
  end

  def destroy_spell(spell_id)
    @removedcharacterspell = CharacterSpell.find_by({ spell_id: spell_id, character_id: id })
    if @removedcharacterspell.destroy
      "spell successfully removed"
    else
      false
    end
  end

  #calculate all spell scores.
  def score_calc
    @character = Character.find_by(id: id)
    @character.nuke_score = @character.nuke_calc
    @character.cc_score = @character.cc_calc
    @character.utility_score = @character.utility_calc
    @character.face_score = @character.face_calc
    @character.save
  end

  #calculate various characer spell scores
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
