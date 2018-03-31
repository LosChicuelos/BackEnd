class CreateAlliances < ActiveRecord::Migration[5.1]
  def change
    create_table :alliances do |t|
      t.text :commentary
      t.string :confirm
      t.references :approval
      t.references :applicant

      t.timestamps
    end
  end
end
