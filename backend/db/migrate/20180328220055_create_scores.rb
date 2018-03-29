class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.text :commentary
      t.integer :score
      t.references :sale, foreign_key: true
      t.references :qualified, foreign_key: true
      t.references :qualifier, foreign_key: true

      t.timestamps
    end
  end
end
