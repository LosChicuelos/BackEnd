class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.date :date
      t.integer :quantity
      t.decimal :amount
      t.references :seller, foreign_key: true
      t.references :buyer, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
