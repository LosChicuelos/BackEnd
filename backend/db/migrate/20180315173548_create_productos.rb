class CreateProductos < ActiveRecord::Migration[5.1]
  def change
    create_table :productos do |t|
      t.string :id
      t.string :tipoproducto
      t.string :idusuario
      t.string :nombre
      t.text :descripcion
      t.decimal :precio
      t.integer :inventario

      t.timestamps
    end
  end
end
