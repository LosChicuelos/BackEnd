class CreateClasificacions < ActiveRecord::Migration[5.1]
  def change
    create_table :clasificacions do |t|
      t.string :id
      t.string :nombre
      t.string :padre

      t.timestamps
    end
  end
end
