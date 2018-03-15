class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :id
      t.string :tipousuario
      t.string :identificacion
      t.string :tipoidentificacion
      t.string :correo
      t.string :telefono
      t.integer :latitud
      t.integer :longitud
      t.string :contrasena

      t.timestamps
    end
  end
end
