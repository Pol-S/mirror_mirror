class CreateCharacterClassSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :character_class_spells do |t|
      t.integer :character_class_id
      t.integer :spell_id

      t.timestamps
    end
  end
end
