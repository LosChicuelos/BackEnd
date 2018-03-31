class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.date :date
      t.integer :quantity
      t.decimal :amount
      t.references :seller 
      t.references :buyer
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
