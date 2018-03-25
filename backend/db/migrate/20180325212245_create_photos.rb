class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.date :date
      t.binary :photo
      t.string :idproducto
      t.article :references

      t.timestamps
    end
  end
end
