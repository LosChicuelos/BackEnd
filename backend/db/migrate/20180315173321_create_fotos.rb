class CreateFotos < ActiveRecord::Migration[5.1]
  def change
    create_table :fotos do |t|
      t.string :id
      t.date :fecha
      t.binary :foto
      t.string :producto

      t.timestamps
    end
  end
end
