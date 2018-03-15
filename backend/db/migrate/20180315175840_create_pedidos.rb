class CreatePedidos < ActiveRecord::Migration[5.1]
  def change
    create_table :pedidos do |t|
      t.string :id
      t.string :idproducto
      t.string :idusuariocomp
      t.string :idusuariovend
      t.date :fecha
      t.integer :cantidad
      t.decimal :monto

      t.timestamps
    end
  end
end
