class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :inventory
      t.references :user, foreign_key: true
      t.references :classification, foreign_key: true

      t.timestamps
    end
  end
end
