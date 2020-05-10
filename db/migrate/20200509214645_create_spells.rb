class CreateSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.text :description
      t.integer :nuker_score
      t.integer :cc_score
      t.integer :utility_score
      t.integer :face_score
      t.integer :level

      t.timestamps
    end
  end
end
