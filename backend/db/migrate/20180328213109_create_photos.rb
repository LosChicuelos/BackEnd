class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.date :date
      t.binary :photo
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
