class CreateInterrogantes < ActiveRecord::Migration[5.1]
  def change
    create_table :interrogantes do |t|
      t.string :id
      t.string :idusuario
      t.string :idproducto
      t.text :pregunta
      t.text :respuesta
      t.date :fecha

      t.timestamps
    end
  end
end
