class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :idclassification
      t.string :iduser
      t.string :name
      t.string :description
      t.decimal :price
      t.integer :inventory
      t.references :classification, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
