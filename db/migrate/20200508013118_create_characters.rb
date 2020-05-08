class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.integer :user_id
      t.string :name
      t.integer :level
      t.integer :character_class_id
      t.string :speciality
      t.integer :nuke_score
      t.integer :cc_score
      t.integer :utility_score
      t.integer :face_score

      t.timestamps
    end
  end
end
