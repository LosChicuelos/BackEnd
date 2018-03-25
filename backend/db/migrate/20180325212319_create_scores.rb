class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.string :idqualifier
      t.string :idqualified
      t.string :idsale
      t.text :commentary
      t.integer :score
      t.references :sale, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
