class CreateMensajes < ActiveRecord::Migration[5.1]
  def change
    create_table :mensajes do |t|
      t.string :id
      t.string :idemisor
      t.string :iddestinatario
      t.string :asunto
      t.text :contenido
      t.date :fecha

      t.timestamps
    end
  end
end
