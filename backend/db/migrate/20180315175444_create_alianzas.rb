class CreateAlianzas < ActiveRecord::Migration[5.1]
  def change
    create_table :alianzas do |t|
      t.string :id
      t.string :usuariosolicitante
      t.string :usuarioconfirma
      t.text :comentario
      t.string :confirmacion

      t.timestamps
    end
  end
end
