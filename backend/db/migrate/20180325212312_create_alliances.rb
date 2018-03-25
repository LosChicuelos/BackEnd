class CreateAlliances < ActiveRecord::Migration[5.1]
  def change
    create_table :alliances do |t|
      t.string :idapplicant
      t.string :idapprove
      t.text :commentary
      t.string :confirm
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
