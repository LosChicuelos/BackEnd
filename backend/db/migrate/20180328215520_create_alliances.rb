class CreateAlliances < ActiveRecord::Migration[5.1]
  def change
    create_table :alliances do |t|
      t.text :commentary
      t.string :confirm
      t.references :approval, foreign_key: true
      t.references :applicant, foreign_key: true

      t.timestamps
    end
  end
end
