class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.string :idarticle
      t.string :iduserpurchase
      t.string :idusersale
      t.date :date
      t.integer :quantity
      t.decimal :amount
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
