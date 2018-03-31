class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.text :commentary
      t.integer :score
      t.references :sale, foreign_key: true
      t.references :qualified
      t.references :qualifier

      t.timestamps
    end
  end
end
