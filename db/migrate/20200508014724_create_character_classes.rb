class CreateCharacterClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :character_classes do |t|
      t.string :character_class
      t.integer :character_class_id

      t.timestamps
    end
  end
end
