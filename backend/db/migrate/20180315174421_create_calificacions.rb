class CreateCalificacions < ActiveRecord::Migration[5.1]
  def change
    create_table :calificacions do |t|
      t.string :id
      t.string :idcalificador
      t.string :idcalificado
      t.string :idventa
      t.text :comentario
      t.integer :prestigio

      t.timestamps
    end
  end
end
